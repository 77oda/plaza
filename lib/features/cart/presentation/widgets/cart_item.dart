import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.model});
  final CartProduct model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.productDetailsScreen, extra: model.product!);
      },
      child: Container(
        height: 200.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: '${model.product!.image}',
                    width: 100.w,
                    height: 100.h,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
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
                            color: Colors.grey,
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
                          '${model.product!.name}',
                          style: TextStyle(fontSize: 15.sp),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          'EGP '
                          '${model.product!.price}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (model.product!.discount != 0)
                          Text(
                            'EGP'
                            '${model.product!.oldPrice}',
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
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: MaterialButton(
                    onPressed: () {
                      int quantity = model.quantity! - 1;
                      if (quantity != 0)
                        context.read<CartCubit>().updateCartProduct(
                          model.id as int,
                          quantity,
                        );
                    },
                    minWidth: 20,
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.remove,
                      size: 17,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Text('${model.quantity}', style: TextStyle(fontSize: 20.sp)),
                SizedBox(width: 5.w),
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: MaterialButton(
                    onPressed: () {
                      int quantity = model.quantity! + 1;
                      if (quantity <= 5)
                        context.read<CartCubit>().updateCartProduct(
                          model.id as int,
                          quantity,
                        );
                    },
                    minWidth: 10,
                    //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.zero,
                    child: Icon(Icons.add, size: 17, color: Colors.green[500]),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    context.read<CartCubit>().removeCartProductLocally(
                      model.product!.id as int,
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(width: 2.5.w),
                      Text(
                        'Remove',
                        style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
