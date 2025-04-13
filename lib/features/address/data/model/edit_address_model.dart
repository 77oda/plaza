import 'package:plaza/features/address/data/model/address_model.dart';

class EditAddressModel {
  late bool status;
  String? message;
  AddressData? data;

  EditAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AddressData.fromJson(json['data']) : null;
  }
}
