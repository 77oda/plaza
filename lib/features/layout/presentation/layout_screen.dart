import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/cart/presentation/cart_screen.dart';
import 'package:plaza/features/categories/presentation/categories_screen.dart';
import 'package:plaza/features/home/presentation/home_screen.dart';
import 'package:plaza/features/layout/presentation/widgets/layout_app_bar.dart';
import 'package:plaza/features/account/presentation/account_screen.dart';

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
    const CartScreen(),
    const AccountScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
