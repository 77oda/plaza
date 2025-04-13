import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';
import 'package:plaza/features/address/presentation/widget/address_widget.dart/address_details.dart';
import 'package:plaza/features/address/presentation/widget/address_widget.dart/address_title_bar.dart';

class ShowAddressScreen extends StatelessWidget {
  const ShowAddressScreen({super.key, required this.model});
  final AddressData model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.watch<AddressCubit>().state is DeleteAddressLoadingState
                  ? const LinearProgressIndicator()
                  : const SizedBox(),
              AddressTitleBar(model: model),
              myDivider(),
              AddressDetails(model: model),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
