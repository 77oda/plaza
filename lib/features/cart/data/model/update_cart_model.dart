import 'package:plaza/features/cart/data/model/cart_model.dart';

class UpdateCartModel {
  late bool status;
  String? message;
  UpdateData? data;

  UpdateCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UpdateData.fromJson(json['data']) : null;
  }
}

class UpdateData {
  CartProduct? cart;
  dynamic subTotal;
  dynamic total;

  UpdateData.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? CartProduct.fromJson(json['cart']) : null;
    subTotal = json['sub_total'];
    total = json['total'];
  }
}
