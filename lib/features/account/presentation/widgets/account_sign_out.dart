import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/utils/service_locator.dart';
import 'package:plaza/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';

class AccountSignOut extends StatelessWidget {
  const AccountSignOut({super.key});

  Future<void> signOut(context) async {
    await CacheHelper.clearAllSecuredData();

    // ✅ أغلق الكيوبتات يدويًا
    await getIt<CartCubit>().close();
    await getIt<AllProductsCubit>().close();

    // ✅ ثم امسحهم من GetIt
    getIt.resetLazySingleton<CartCubit>();
    getIt.resetLazySingleton<AllProductsCubit>();

    // ✅ بعد كل شيء، رجّع المستخدم لصفحة تسجيل الدخول
    GoRouter.of(context).pushReplacement(AppRouter.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 60.h,
      child: InkWell(
        onTap: () async {
          await signOut(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.power_settings_new),
            SizedBox(width: 10.h),
            Text('SignOut', style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
