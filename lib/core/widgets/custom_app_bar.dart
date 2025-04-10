import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/app_logo.dart';

AppBar customAppBar() => AppBar(
  titleSpacing: 0,
  title: AppLogo(),
  actions: [
    IconButton(
      onPressed: () {
        // navigateTo(context, SearchScreen(ShopCubit.get(context)));
      },
      icon: Icon(Icons.search),
    ),
  ],
);
