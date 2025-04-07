import 'package:equatable/equatable.dart';
import 'package:plaza/features/home/data/model/banners_model.dart';

abstract class BannersState extends Equatable {
  const BannersState();

  @override
  List<Object> get props => [];
}

final class BannersInitialState extends BannersState {}

class BannersLoadingState extends BannersState {}

class BannersSuccessState extends BannersState {
  final BannersModel bannersModel;
  const BannersSuccessState(this.bannersModel);
}

class BannersErrorState extends BannersState {
  final String error;
  const BannersErrorState(this.error);
}
