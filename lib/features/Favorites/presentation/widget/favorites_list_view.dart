import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/Favorites/data/model/favorite_model.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_list_view_item.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key, required this.model});
  final List<FavoriteData> model;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder:
          (context, index) =>
              FavoritesListViewItem(model: model[index].product as ProductData),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: model.length,
    );
  }
}
