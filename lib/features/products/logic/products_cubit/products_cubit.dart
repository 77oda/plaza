import 'package:bloc/bloc.dart';
import 'package:plaza/features/products/data/repos/products_repo.dart';
import 'package:plaza/features/products/logic/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitialState());
  final ProductsRepo productsRepo;

  Future<void> fetchProducts(int categoryId) async {
    emit(ProductsLoadingState());
    final result = await productsRepo.fetchProducts(categoryId);
    result.fold(
      (failure) {
        if (!isClosed) emit(ProductsErrorState(failure.errMessage));
      },
      (products) {
        if (!isClosed) emit(ProductsSuccessState(products));
      },
    );
  }
}
