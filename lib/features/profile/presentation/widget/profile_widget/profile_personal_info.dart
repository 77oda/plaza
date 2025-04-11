import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/profile/logic/profile_cubit/profile_cubit.dart';

class ProfilePersonalInfo extends StatefulWidget {
  const ProfilePersonalInfo({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
  });
  final String name;
  final String phone;
  final dynamic email;

  @override
  State<ProfilePersonalInfo> createState() => _ProfilePersonalInfoState();
}

class _ProfilePersonalInfoState extends State<ProfilePersonalInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              current is UpdateProfileSuccessState ||
              current is UpdateProfileErrorState,
      listener:
          (context, state) => {
            if (state is UpdateProfileSuccessState)
              {
                if (state.userModel.status == true)
                  {
                    setState(() {
                      isEdit = !isEdit;
                    }),
                  },
                showToast(state.userModel.message),
              }
            else if (state is UpdateProfileErrorState)
              {showToast(state.error)},
          },
      child: Form(
        key: formkey,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (context.watch<ProfileCubit>().state
                  is UpdateProfileLoadingState)
                const LinearProgressIndicator(),
              Row(
                children: [
                  Text(
                    'PERSONAL INFORMATION',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  context.watch<ProfileCubit>().state
                          is UpdateProfileLoadingState
                      ? const SizedBox()
                      : TextButton(
                        onPressed: () async {
                          if (isEdit) {
                            if (formkey.currentState!.validate()) {
                              await context
                                  .read<ProfileCubit>()
                                  .updateProfileData(
                                    nameController.text,
                                    phoneController.text,
                                    widget.email,
                                  );
                            }
                          } else {
                            setState(() {
                              isEdit = !isEdit;
                            });
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.grey, size: 15),
                            SizedBox(width: 5.w),
                            Text(
                              isEdit ? 'Save' : 'Edit',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
              SizedBox(height: 15.w),
              Text('Name', style: TextStyle(fontSize: 15.sp)),
              customFormField(
                controller: nameController,
                context: context,
                prefix: Icons.person,
                enabled: isEdit ? true : false,
                validate: (value) {
                  if (value!.isEmpty) return 'This field cant be Empty';
                },
              ),
              SizedBox(height: 40.h),
              Text('Phone', style: TextStyle(fontSize: 15.sp)),
              customFormField(
                context: context,
                controller: phoneController,
                prefix: Icons.phone,
                enabled: isEdit ? true : false,
                validate: (value) {
                  if (value!.isEmpty) return 'This field cant be Empty';
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
