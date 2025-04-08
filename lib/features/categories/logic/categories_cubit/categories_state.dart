part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoriesModel categoriesModel;
  const CategoriesSuccessState(this.categoriesModel);
}

class CategoriesErrorState extends CategoriesState {
  final String error;
  const CategoriesErrorState(this.error);
}
