import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';

class ProductAddToCart extends StatelessWidget {
  const ProductAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          ),
          backgroundColor: WidgetStateProperty.all(ColorsManager.primaryColor),
        ),
        onPressed: () {
          // if (ShopCubit.get(context).cart[model.id]) {
          //   showToast(
          //     'Already in Your Cart \nCheck your cart To Edit or Delete ',
          //   );
          // } else {
          //   // ShopCubit.get(context).ChangeToCart(model.id);
          //   scaffoldKey.currentState!.showBottomSheet(
          //     (context) => Container(
          //       color: Colors.grey[300],
          //       padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Row(
          //             children: [
          //                Icon(
          //                 Icons.check_circle,
          //                 color: Colors.green,
          //                 size: 30.sp,
          //               ),
          //                SizedBox(width: 10.w),
          //               Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       name,
          //                       maxLines: 2,
          //                       overflow: TextOverflow.ellipsis,
          //                     ),
          //                      SizedBox(height: 5.h),
          //                      Text(
          //                       'Added to Cart',
          //                       style: TextStyle(
          //                         color: Colors.grey,
          //                         fontSize: 13.sp,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //            SizedBox(height: 10.h),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               OutlinedButton(
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //                 child: const Text('CONTINUE SHOPPING'),
          //               ),
          //               const SizedBox(width: 10),
          //               ElevatedButton(
          //                 onPressed: () {
          //                   // navigateTo(context, ShopLayout());
          //                   // ShopCubit.get(context).currentIndex = 3;
          //                 },
          //                 child: const Text('CHECKOUT'),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //     elevation: 50,
          //   );
          // }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, color: Colors.white),
            SizedBox(width: 10.w),
            Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
