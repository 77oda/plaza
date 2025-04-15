import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/custom_app_bar.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.model});
  final ProductData model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ProductDetailsBody(model: model),
    );
  }
}
