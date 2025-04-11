import 'package:equatable/equatable.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

sealed class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

final class AllProductsInitialState extends AllProductsState {}

class AllProductsLoadingState extends AllProductsState {}

class AllProductsSuccessState extends AllProductsState {
  final ProductsModel productsModel;
  const AllProductsSuccessState(this.productsModel);
}

class AllProductsErrorState extends AllProductsState {
  final String error;
  const AllProductsErrorState(this.error);
}
