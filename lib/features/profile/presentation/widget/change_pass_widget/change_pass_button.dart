import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/profile/logic/change_pass_cubit/change_pass_cubit.dart';

class ChangePassButton extends StatelessWidget {
  const ChangePassButton({
    super.key,
    required this.changePasskey,
    required this.currentPass,
    required this.newPass,
  });
  final GlobalKey<FormState> changePasskey;
  final TextEditingController currentPass;
  final TextEditingController newPass;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePassCubit, ChangePassState>(
      listener: (context, state) {
        if (state is ChangePassSuccessState) {
          showToast(state.userModel.message);
        } else if (state is ChangePassErrorState) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        return state is ChangePassLoadingState
            ? Center(child: CircularProgressIndicator())
            : customButton(
              onTap: () {
                if (changePasskey.currentState!.validate()) {
                  context.read<ChangePassCubit>().changePass(
                    currentPass.text,
                    newPass.text,
                  );
                }
              },
              text: 'Change Password',
            );
      },
    );
  }
}
