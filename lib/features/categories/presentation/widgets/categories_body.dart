import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/categories/presentation/widgets/categories_item.dart';
import 'package:plaza/features/categories/presentation/widgets/categories_shimmer.dart';
import 'package:plaza/features/categories/logic/categories_cubit/categories_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState)
          return CategoriesShimmer();
        else if (state is CategoriesErrorState)
          return Center(child: Text(state.error));
        else if (state is CategoriesSuccessState)
          return ListView.separated(
            itemBuilder:
                (context, index) => CategoriesItem(
                  model: state.categoriesModel.data!.data![index],
                ),
            separatorBuilder:
                (context, index) => Container(
                  color: Colors.grey[500],
                  height: 1.h,
                  width: double.infinity,
                ),
            itemCount: state.categoriesModel.data!.data!.length,
          );
        else
          return const SizedBox();
      },
    );
  }
}
