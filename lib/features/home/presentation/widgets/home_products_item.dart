import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/home/data/model/home_model.dart';

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
        padding: EdgeInsetsDirectional.only(start: 8.w, bottom: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                  height: 150,
                  width: 150,
                ),
                if (model.discount != 0)
                  Container(
                    color: ColorsManager.primaryColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Discount',
                        style: TextStyle(fontSize: 14, color: Colors.white),
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
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${model.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    if (model.discount != 0)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'EGP',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '${model.oldPrice}',
                            style: const TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            '${model.discount}' + '% OFF',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 11,
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
