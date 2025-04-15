import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';
import 'package:plaza/features/address/presentation/save_address_screen.dart';
import 'package:plaza/features/address/presentation/show_address_screen.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listenWhen: (previous, current) => current is DeleteAddressSuccessState,
      listener: (context, state) {
        if (state is DeleteAddressSuccessState)
          showToast(state.addressModel.message);
      },
      buildWhen:
          (previous, current) =>
              current is AddressSuccessState ||
              current is AddressLoadingState ||
              current is AddressErrorState ||
              current is DeleteAddressSuccessState ||
              current is SaveAddressSuccessState ||
              current is ButtomActionState,
      builder: (context, state) {
        if (state is AddressLoadingState)
          return Center(child: CircularProgressIndicator());
        else if (state is AddressErrorState)
          return Center(child: Text(state.error));
        else if (state is AddressSuccessState) {
          if (state.addressModel.data!.data!.isEmpty)
            return SaveAddressScreen(isEdit: false);
          else
            return ShowAddressScreen(model: state.addressModel.data!.data![0]);
        } else if (state is DeleteAddressSuccessState)
          return SaveAddressScreen(isEdit: false);
        else if (state is SaveAddressSuccessState)
          return ShowAddressScreen(model: state.addressData);
        else if (state is ButtomActionState)
          return SaveAddressScreen(isEdit: true, model: state.addressData);
        else
          return const SizedBox();
      },
    );
  }
}
