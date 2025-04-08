import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/features/home/logic/home_cubit/home_cubit.dart';
import 'package:plaza/features/home/presentation/widgets/home_products_item.dart';
import 'package:plaza/features/home/presentation/widgets/home_products_shimmer.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState)
          return HomeProductsShimmer();
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
