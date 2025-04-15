import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/custom_app_bar.dart';
import 'package:plaza/features/Favorites/presentation/widget/favorites_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(context), body: FavoritesBody());
  }
}
