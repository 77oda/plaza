// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:plaza/core/theming/colors.dart';
// import 'package:plaza/features/layout/presentation/layout_screen.dart';

// class LayoutNavigationBar extends StatefulWidget {
//   const LayoutNavigationBar({super.key});

//   @override
//   State<LayoutNavigationBar> createState() => _LayoutNavigationBarState();
// }

// class _LayoutNavigationBarState extends State<LayoutNavigationBar> {
//   List<BottomNavigationBarItem> items = [
//     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//     BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
//     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//     BottomNavigationBarItem(
//       icon: Stack(
//         alignment: AlignmentDirectional.topEnd,
//         children: [
//           Icon(Icons.shopping_cart_outlined),
//           //if(cartLength!= 0)
//           // CircleAvatar(backgroundColor: Colors.green,radius: 6,
//           //   child:Text('${ShopCubit.get(context).cartModel.data!.cartItems.length}',style: TextStyle(fontSize: 10,color: Colors.white),),),
//         ],
//       ),
//       label: 'Cart',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       iconSize: 20.sp,
//       selectedIconTheme: const IconThemeData(size: 25),
//       unselectedLabelStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 12,
//       ),
//       selectedLabelStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 15,
//       ),
//       selectedItemColor: ColorsManager.primaryColor,
//       unselectedItemColor: Colors.grey[500],
//       // elevation: 10,
//       onTap: (index) {
//         setState(() {
//           currentIndex = index;
//         });
//       },
//       items: items,
//       // onTap: (index) {
//       //   // if (index == 3)
//       //   //   showBottomSheet = true;
//       //   // else if(ShopCubit.get(context).cartModel.data!.cartItems.length == 0)
//       //   //   showBottomSheet = false;
//       //   // else
//       //   //   showBottomSheet = false;
//       //   // return cubit.changeBottomNav(index);
//       // },
//     );
//   }
// }
