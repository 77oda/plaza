import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/categories/data/model/categories_model.dart';
import 'package:plaza/features/categories/data/repos/categories_repo.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitialState());
  final CategoriesRepo categoriesRepo;

  Future<void> fetchCategories() async {
    emit(CategoriesLoadingState());
    final result = await categoriesRepo.fetchCategories();
    result.fold(
      (failure) => emit(CategoriesErrorState(failure.errMessage)),
      (categories) => emit(CategoriesSuccessState(categories)),
    );
  }
}
