import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:shimmer/shimmer.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.model});
  final ProductData model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.productDetailsScreen, extra: model);
      },
      child: Container(
        height: 140.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            Hero(
              tag: model.id as int,
              child: CachedNetworkImage(
                imageUrl: '${model.image}',
                width: 120.w,
                height: 100.h,
                errorWidget: (context, url, error) => Icon(Icons.error),
                placeholder:
                    (context, url) => Shimmer(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.grey, Colors.white, Colors.grey],
                      ),
                      child: Container(color: Colors.grey),
                    ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    style: TextStyle(fontSize: 15.sp),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text(
                    'EGP '
                    '${model.price}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
