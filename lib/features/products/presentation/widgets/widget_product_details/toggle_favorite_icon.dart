import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_state.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';

class ToggleFavoriteIcon extends StatelessWidget {
  const ToggleFavoriteIcon({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleFavoriteCubit, ToggleFavoriteState>(
      builder: (context, state) {
        return context.watch<AllProductsCubit>().favorites[id] == null
            ? SizedBox()
            : IconButton(
              onPressed: () {
                context.read<ToggleFavoriteCubit>().toggleFavorite(id);
              },
              icon:
                  context.watch<AllProductsCubit>().favorites[id]
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border, color: Colors.red),
              iconSize: 35,
            );
      },
    );
  }
}
