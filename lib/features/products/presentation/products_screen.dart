import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/custom_app_bar.dart';
import 'package:plaza/features/products/presentation/widgets/widget_products/Products_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(),
        body: ProductsBody(categoryName: categoryName),
      ),
    );
  }
}
