import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/features/categories/data/model/categories_model.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem({required this.model, super.key});
  CategoryData model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.productsScreen,
          extra: {'id': model.id, 'name': model.name},
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            CachedNetworkImage(
              placeholder:
                  (context, url) => Shimmer(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.grey, Colors.white, Colors.grey],
                    ),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      color: Colors.grey[300],
                    ),
                  ),
              imageUrl: '${model.image}',
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            SizedBox(width: 15.w),
            Text(
              '${model.name}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
