import 'package:equatable/equatable.dart';
import 'package:plaza/features/home/data/model/home_model.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeModel homeModel;
  const HomeSuccessState(this.homeModel);
}

class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState(this.error);
}
