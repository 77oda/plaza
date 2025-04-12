part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitialState extends NotificationsState {}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsSuccessState extends NotificationsState {
  final NotificationsModel notificationsModel;
  const NotificationsSuccessState(this.notificationsModel);
}

class NotificationsErrorState extends NotificationsState {
  final String error;
  const NotificationsErrorState(this.error);
}
