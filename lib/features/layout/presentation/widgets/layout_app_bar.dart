import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/widgets/app_logo.dart';

AppBar layoutAppBar(context) {
  return AppBar(
    titleSpacing: 10,
    title: AppLogo(),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none_outlined),
      ),
      IconButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.searchScreen);
        },
        icon: const Icon(Icons.search),
      ),
    ],
  );
}
