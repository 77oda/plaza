// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:plaza/features/products/logic/products_cubit/products_cubit.dart';

// class ToggleFavoriteIcon extends StatelessWidget {
//   const ToggleFavoriteIcon({super.key, required this.id});
//   final int id;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         context.read<ProductsCubit>().toggleFavorite(id);
//         print(context.read<ProductsCubit>().favorites);
//         // context.read<ToggleFavoriteCubit>().toggleFavorite(id);
//       },
//       icon:
//           context.watch<ProductsCubit>().favorites[id]
//               ? Icon(Icons.favorite, color: Colors.red)
//               : Icon(Icons.favorite_border),
//       padding: const EdgeInsets.all(0),
//       iconSize: 20.sp,
//     );
//   }
// }
