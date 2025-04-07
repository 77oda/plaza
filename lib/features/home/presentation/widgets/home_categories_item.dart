import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/home/data/model/categories_model.dart';

class HomeCategoriesItem extends StatelessWidget {
  HomeCategoriesItem({required this.model, super.key});
  CategoryData model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ShopCubit.get(context).getCategoriesDetailData(model.id);
        // navigateTo(context, CategoryProductsScreen(model.name));
      },
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.primaryColor,
                radius: 36.r,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35.r,
                child: CachedNetworkImage(
                  imageUrl: "${model.image}",
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text('${model.name}'),
        ],
      ),
    );
  }
}
