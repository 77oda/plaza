import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:plaza/features/search/presentation/widget/search_app_bar.dart';
import 'package:plaza/features/search/presentation/widget/search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<ProductData> searchedProducts = [];

  List<ProductData>? searchProducts(String searchedProduct) {
    return context
        .read<AllProductsCubit>()
        .allProducts
        ?.data!
        .data!
        .where(
          (element) => element.name!.toLowerCase().contains(
            searchedProduct.toLowerCase(),
          ),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchedProducts = searchProducts(searchController.text) ?? [];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context, searchController, searchProducts),
      body:
          searchController.text.isEmpty
              ? SizedBox()
              : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) =>
                        SearchItem(model: searchedProducts[index]),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: searchedProducts.length,
              ),
    );
  }
}
