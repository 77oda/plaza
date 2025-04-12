import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/notifications/data/model/notifications_model.dart';
import 'package:plaza/features/notifications/data/repos/notifications_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepo)
    : super(NotificationsInitialState());
  final NotificationsRepo notificationsRepo;

  Future<void> fetchNotifications() async {
    emit(NotificationsLoadingState());
    final result = await notificationsRepo.fetchNotifications();
    result.fold(
      (failure) => emit(NotificationsErrorState(failure.errMessage)),
      (notifications) => emit(NotificationsSuccessState(notifications)),
    );
  }
}
