import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/notifications/logic/notifications_cubit/notifications_cubit.dart';
import 'package:plaza/features/notifications/presentation/widget/notifications_item.dart';
import 'package:plaza/features/notifications/presentation/widget/notifications_shimmer.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoadingState)
          return NotificationsShimmer();
        else if (state is NotificationsErrorState)
          return Center(child: Text(state.error));
        else if (state is NotificationsSuccessState)
          return ListView.separated(
            itemCount: state.notificationsModel.data!.data!.length,
            physics: BouncingScrollPhysics(),
            itemBuilder:
                (context, index) => NotificationsItem(
                  model: state.notificationsModel.data!.data![index],
                ),
            separatorBuilder: (context, index) => myDivider(),
          );
        else
          return const SizedBox();
      },
    );
  }
}
