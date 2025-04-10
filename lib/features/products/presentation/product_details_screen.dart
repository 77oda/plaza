import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/custom_app_bar.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.model});
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductData model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(),
      body: ProductDetailsBody(model: model),
    );
  }
}
