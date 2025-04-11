import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:plaza/features/profile/presentation/widget/profile_widget/profile_ahlan.dart';
import 'package:plaza/features/profile/presentation/widget/profile_widget/profile_personal_info.dart';
import 'package:plaza/features/profile/presentation/widget/profile_widget/profile_security_info.dart';
import 'package:plaza/features/profile/presentation/widget/profile_widget/profile_shimmer.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen:
          (previous, current) =>
              current is ProfileSuccessState ||
              current is ProfileLoadingState ||
              current is ProfileErrorState,
      builder: (context, state) {
        if (state is ProfileLoadingState)
          return ProfileShimmer();
        else if (state is ProfileErrorState)
          return Center(child: Text(state.error));
        else if (state is ProfileSuccessState) {
          var model = state.userModel.data!;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAhlan(
                  name: model.name as String,
                  email: model.email as String,
                ),
                divider(),
                ProfilePersonalInfo(
                  name: model.name as String,
                  phone: model.phone as String,
                  email: model.email as String,
                ),
                divider(),
                ProfileSecurityInfo(),
              ],
            ),
          );
        } else
          return const SizedBox();
      },
    );
  }
}

Widget divider() {
  return Container(height: 15.h, color: Colors.grey[300]);
}
