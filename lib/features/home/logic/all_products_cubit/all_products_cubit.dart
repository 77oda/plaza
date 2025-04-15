import 'package:bloc/bloc.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';

import 'package:plaza/features/home/logic/all_products_cubit/all_products_state.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitialState());
  final HomeRepo homeRepo;

  Map<dynamic, dynamic> favorites = {};
  Map<dynamic, dynamic> cartProducts = {};

  ProductsModel? allProducts;

  List<ProductData> get productsWithDiscount {
    return allProducts?.data?.data?.where((e) => e.discount != 0).toList() ??
        [];
  }

  Future<void> fetchAllProducts() async {
    emit(AllProductsLoadingState());
    final result = await homeRepo.fetchAllProducts();
    result.fold(
      (failure) {
        if (!isClosed) emit(AllProductsErrorState(failure.errMessage));
      },
      (products) {
        allProducts = products;
        for (var element in products.data!.data!) {
          favorites.addAll({element.id: element.inFavorites});
        }
        for (var element in products.data!.data!) {
          cartProducts.addAll({element.id: element.inCart});
        }
        if (!isClosed) emit(AllProductsSuccessState(products));
      },
    );
  }
}
