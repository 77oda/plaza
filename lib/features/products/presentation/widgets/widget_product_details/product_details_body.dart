import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_add_to_cart.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_free_delivery.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_offer_details.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_overview.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_page_view.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/product_price.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.model});
  final ProductData model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              children: [
                Text(model.name!, style: TextStyle(fontSize: 20.sp)),
                ProductPageView(images: model.images, id: model.id as int),
                SizedBox(height: 15.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductPrice(
                      price: model.price as num,
                      oldPrice: model.oldPrice as num,
                      discount: model.discount as num,
                    ),
                    SizedBox(height: 15.h),
                    myDivider(),
                    SizedBox(height: 15.h),
                    ProductFreeDelivery(),
                    SizedBox(height: 15.h),
                    myDivider(),
                    SizedBox(height: 15.h),
                    ProductOfferDetails(),
                    SizedBox(height: 15.h),
                    myDivider(),
                    SizedBox(height: 15.h),
                    ProductOverview(description: model.description as String),
                    SizedBox(height: 20.h),
                  ],
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
        ProductAddToCart(),
      ],
    );
  }
}
