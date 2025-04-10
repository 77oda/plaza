import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';
import 'package:plaza/features/profile/logic/profile_cubit/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Ahlan ${cubit.userModel!.data!.name!.split(' ').elementAt(0)}',
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // Text(
                        //   '${cubit.userModel!.data!.email}',
                        //   style: TextStyle(fontSize: 15),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 280.h,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (state is UpdateProfileLoadingState)
                        //   Column(
                        //     children: [
                        //       LinearProgressIndicator(),
                        //       SizedBox(height: 20),
                        //     ],
                        //   ),
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
                            TextButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  // editPressed(
                                  //   context: context,
                                  //   name: nameController.text,
                                  //   phone: phoneController.text,
                                  //   email: cubit.userModel!.data!.email,
                                  // );
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5.w),
                                  // Text(
                                  //   '$editText',
                                  //   style: TextStyle(color: Colors.grey),
                                  // ),
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
                          // enabled: isEdit ? true : false,
                          validate: (value) {
                            if (value!.isEmpty)
                              return 'This field cant be Empty';
                          },
                        ),
                        SizedBox(height: 40.h),
                        Text('Phone', style: TextStyle(fontSize: 15.sp)),
                        customFormField(
                          context: context,
                          controller: phoneController,
                          prefix: Icons.phone,
                          // enabled: isEdit ? true : false,
                          validate: (value) {
                            if (value!.isEmpty)
                              return 'This field cant be Empty';
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 15.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SECURITY INFORMATION',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        OutlinedButton(
                          onPressed: () {
                            // navigateTo(context, ChangePasswordScreen());
                          },
                          child: Text('Change Password'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
