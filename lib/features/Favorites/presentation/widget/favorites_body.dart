import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/features/Favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:plaza/features/Favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_num.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_list_view.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_shimmer.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen:
          (previous, current) =>
              current is FavoriteSuccessState ||
              current is FavoriteLoadingState ||
              current is FavoriteErrorState,
      builder: (context, state) {
        if (state is FavoriteLoadingState)
          return FavoritesShimmer();
        else if (state is FavoriteErrorState)
          return Center(child: Text(state.error));
        else if (state is FavoriteSuccessState)
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FavoritesNum(
                  total: context.watch<FavoriteCubit>().favorites.length,
                ),
                FavoritesListView(
                  model: context.watch<FavoriteCubit>().favorites,
                ),
              ],
            ),
          );
        else
          return const SizedBox();
      },
    );
  }
}
