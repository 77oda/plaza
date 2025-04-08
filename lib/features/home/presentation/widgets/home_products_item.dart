import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/home/data/model/home_model.dart';
import 'package:shimmer/shimmer.dart';

class HomeProductsItem extends StatelessWidget {
  HomeProductsItem({super.key, required this.model});
  HomeProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ShopCubit.get(context).getProductData(model.id);
        // navigateTo(context, ProductScreen());
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsetsDirectional.only(start: 8.w, bottom: 8.h, end: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: "${model.image}",
                  height: 150.h,
                  width: double.infinity,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  placeholder:
                      (context, url) => Shimmer(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey, Colors.white, Colors.grey],
                        ),
                        child: Container(
                          height: 150.h,
                          width: 150.w,
                          color: Colors.grey[300],
                        ),
                      ),
                ),
                if (model.discount != 0)
                  Container(
                    color: ColorsManager.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        'Discount',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10.h),
            Text('${model.name}', maxLines: 2, overflow: TextOverflow.ellipsis),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'EGP',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '${model.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    if (model.discount != 0)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'EGP',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '${model.oldPrice}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            '${model.discount}' + '% OFF',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const Spacer(),
                // IconButton(
                //   onPressed: () {
                //     // ShopCubit.get(context).changeToFavorite(model.id);
                //     // print(model.id);
                //   },
                //   icon: Conditional.single(
                //     context: context,
                //     conditionBuilder:
                //         (context) => ShopCubit.get(context).favorites[model.id],
                //     widgetBuilder:
                //         (context) => ShopCubit.get(context).favoriteIcon,
                //     fallbackBuilder:
                //         (context) => ShopCubit.get(context).unFavoriteIcon,
                //   ),
                //   padding: const EdgeInsets.all(0),
                //   iconSize: 20,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
