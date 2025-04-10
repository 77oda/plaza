import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/features/products/logic/products_cubit/products_cubit.dart';
import 'package:plaza/features/products/logic/products_cubit/products_state.dart';
import 'package:plaza/features/products/presentation/widgets/widget_products/products_item.dart';
import 'package:plaza/features/products/presentation/widgets/widget_products/products_shimmer.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState)
          return ProductsShimmer();
        else if (state is ProductsErrorState)
          return Center(child: Text(state.error));
        else if (state is ProductsSuccessState)
          return Container(
            color: Colors.grey[300],
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.74,
              mainAxisSpacing: 2,
              children: List.generate(
                state.productsModel.data!.data!.length,
                (index) =>
                    ProductsItem(model: state.productsModel.data!.data![index]),
              ),
            ),
          );
        else
          return const SizedBox();
      },
    );
  }
}
