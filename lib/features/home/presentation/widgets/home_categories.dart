import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/categories/logic/categories_cubit/categories_cubit.dart';
import 'package:plaza/features/home/presentation/widgets/home_categories_item.dart';
import 'package:plaza/features/home/presentation/widgets/home_categories_shimmer.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState)
          return HomeCategoriesShimmer();
        else if (state is CategoriesErrorState)
          return Center(child: Text(state.error));
        else if (state is CategoriesSuccessState)
          return Container(
            color: Colors.white,
            height: 140.h,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => HomeCategoriesItem(
                    model: state.categoriesModel.data!.data![index],
                  ),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: state.categoriesModel.data!.data!.length,
            ),
          );
        else
          return const SizedBox();
      },
    );
  }
}
