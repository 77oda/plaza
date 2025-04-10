import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:plaza/features/home/logic/home_cubit/home_cubit.dart';
import 'package:plaza/features/products/presentation/widgets/widget_product_details/toggle_favorite_icon.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPageView extends StatelessWidget {
  ProductPageView({super.key, required this.images, required this.id});
  final List<String>? images;
  final int id;
  PageController productImages = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400.h,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              PageView.builder(
                controller: productImages,
                itemBuilder:
                    (context, index) => CachedNetworkImage(
                      imageUrl: images![index],
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      placeholder:
                          (context, url) => Shimmer(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.grey, Colors.white, Colors.grey],
                            ),
                            child: Container(color: Colors.white),
                          ),
                    ),
                itemCount: images!.length,
              ),
              ToggleFavoriteIcon(id: id),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SmoothPageIndicator(
          controller: productImages,
          count: images!.length,
          effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.deepOrange,
            expansionFactor: 4,
            dotHeight: 7,
            dotWidth: 10,
            spacing: 10,
          ),
        ),
      ],
    );
  }
}
