import 'package:flutter/material.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_list_view_shimmer.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_num_shimmer.dart';

class FavoritesShimmer extends StatelessWidget {
  const FavoritesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [FavoritesNumShimmer(), FavoritesListViewShimmer()],
      ),
    );
  }
}
