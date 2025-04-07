import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/home/logic/cubit/home_cubit.dart';
import 'package:plaza/features/home/presentation/widgets/home_products_item.dart';
import 'package:shimmer/shimmer.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState)
          return Container(
            color: Colors.white,
            height: 140.h,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 36.r,
                        child: Shimmer(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey, Colors.white, Colors.grey],
                          ),
                          child: Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Shimmer(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey, Colors.white, Colors.grey],
                        ),
                        child: Container(
                          width: 70.w,
                          height: 15.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: 8,
            ),
          );
        else if (state is HomeErrorState)
          return Center(child: Text(state.error));
        else if (state is HomeSuccessState)
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 2,
            childAspectRatio: 0.74,
            mainAxisSpacing: 2,
            children: List.generate(
              state.homeModel.data!.products.length,
              (index) => HomeProductsItem(
                model: state.homeModel.data!.products[index],
              ),
            ),
          );
        else
          return const SizedBox();
      },
    );
  }
}
