import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/home/data/model/categories_model.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitialState());
  final HomeRepo homeRepo;

  Future<void> fetchCategories() async {
    emit(CategoriesLoadingState());
    final result = await homeRepo.fetchCategories();
    result.fold(
      (failure) => emit(CategoriesErrorState(failure.errMessage)),
      (categories) => emit(CategoriesSuccessState(categories)),
    );
  }
}
