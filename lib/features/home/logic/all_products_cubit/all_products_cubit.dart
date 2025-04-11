import 'package:bloc/bloc.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';

import 'package:plaza/features/home/logic/all_products_cubit/all_products_state.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitialState());
  final HomeRepo homeRepo;

  Map<dynamic, dynamic> favorites = {};
  ProductsModel? allProducts;

  Future<void> fetchAllProducts() async {
    emit(AllProductsLoadingState());
    final result = await homeRepo.fetchAllProducts();
    result.fold((failure) => emit(AllProductsErrorState(failure.errMessage)), (
      products,
    ) {
      allProducts = products;
      for (var element in products.data!.data!) {
        favorites.addAll({element.id: element.inFavorites});
      }
      emit(AllProductsSuccessState(products));
    });
  }
}
