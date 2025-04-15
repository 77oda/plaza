import 'package:plaza/features/cart/data/model/cart_model.dart';

class ToggleCartModel {
  late bool status;
  String? message;
  CartProduct? data;

  ToggleCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CartProduct.fromJson(json['data']) : null;
  }
}
