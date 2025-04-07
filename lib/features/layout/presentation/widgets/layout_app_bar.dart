import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/app_logo.dart';

AppBar layoutAppBar() {
  return AppBar(
    titleSpacing: 10,
    title: AppLogo(),
    actions: [
      IconButton(
        onPressed: () {
          // ShopCubit.get(context).getNotificationData();
          // navigateTo(context, NotificationScreen());
        },
        icon: const Icon(Icons.notifications_none_outlined),
      ),
      IconButton(
        onPressed: () {
          // navigateTo(context, SearchScreen(ShopCubit.get(context)));
        },
        icon: const Icon(Icons.search),
      ),
    ],
  );
}
