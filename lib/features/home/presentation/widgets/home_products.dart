import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_state.dart';
import 'package:plaza/features/products/presentation/widgets/widget_products/products_item.dart';
import 'package:plaza/features/products/presentation/widgets/widget_products/products_shimmer.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      buildWhen:
          (previous, current) =>
              current is AllProductsSuccessState ||
              current is AllProductsLoadingState ||
              current is AllProductsErrorState,
      builder: (context, state) {
        if (state is AllProductsLoadingState)
          return ProductsShimmer();
        else if (state is AllProductsErrorState)
          return Center(child: Text(state.error));
        else if (state is AllProductsSuccessState) {
          var productsWithDiscount =
              context.read<AllProductsCubit>().productsWithDiscount;
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 2,
            childAspectRatio: 0.74,
            mainAxisSpacing: 2,
            children: List.generate(
              productsWithDiscount.length,
              (index) => ProductsItem(model: productsWithDiscount[index]),
            ),
          );
        } else
          return const SizedBox();
      },
    );
  }
}
