import 'package:equatable/equatable.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final ProductsModel productsModel;
  const ProductsSuccessState(this.productsModel);
}

class ProductsErrorState extends ProductsState {
  final String error;
  const ProductsErrorState(this.error);
}
