import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/core/utils/service_locator.dart';
import 'package:plaza/features/cart/presentation/cart_screen.dart';
import 'package:plaza/features/categories/presentation/categories_screen.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:plaza/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:plaza/features/home/logic/cubit/home_cubit.dart';
import 'package:plaza/features/home/presentation/home_screen.dart';
import 'package:plaza/features/layout/presentation/widgets/layout_app_bar.dart';
import 'package:plaza/features/profile/presentation/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  List<Widget> layoutPage = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<BannersCubit>()..fetchBanners(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..fetchHomeProducts(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: layoutAppBar(),
          body: layoutPage[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            iconSize: 20.sp,
            selectedIconTheme: const IconThemeData(size: 25),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            selectedItemColor: ColorsManager.primaryColor,
            unselectedItemColor: Colors.grey[500],
            elevation: 10,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: items,
          ),
        ),
      ),
    );
  }
}
