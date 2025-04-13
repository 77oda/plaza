import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/data/model/edit_address_model.dart';

abstract class AddressRepo {
  Future<Either<Failure, AddressModel>> fetchAddress();
  Future<Either<Failure, EditAddressModel>> addAddress(
    String city,
    String region,
    String details,
    String notes,
  );
  Future<Either<Failure, EditAddressModel>> deleteAddress(int id);
}
