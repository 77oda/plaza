import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/Favorites/logic/favorites_cubit/favorites_cubit.dart';

import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesListViewItem extends StatelessWidget {
  const FavoritesListViewItem({super.key, required this.model});
  final ProductData model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: '${model.image}',
                  width: 100.w,
                  height: 100.h,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      if (model.discount != 0)
                        Text(
                          'EGP'
                          '${model.oldPrice}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.grey),
              TextButton(
                onPressed: () {
                  // ShopCubit.get(context).changeToFavorite(model.id);
                  // ShopCubit.get(context).ChangeToCart(model.id);
                },
                child: Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Spacer(),
              Icon(Icons.delete_outline_outlined, color: Colors.grey),
              TextButton(
                onPressed: () {
                  context.read<FavoriteCubit>().removeFavoriteLocally(
                    model.id as int,
                  );
                },
                child: Text('Remove', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
