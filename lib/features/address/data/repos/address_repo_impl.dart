import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/data/model/edit_address_model.dart';
import 'package:plaza/features/address/data/repos/address_repo.dart';

class AddressRepoImpl extends AddressRepo {
  final ApiService apiService;

  AddressRepoImpl(this.apiService);

  @override
  Future<Either<Failure, EditAddressModel>> deleteAddress(int id) async {
    try {
      final response = await apiService.deleteData(
        endPoint: '${ApiEndPoints.address}/$id',
      );
      return right(EditAddressModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> fetchAddress() async {
    try {
      final response = await apiService.getData(endPoint: ApiEndPoints.address);
      return right(AddressModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, EditAddressModel>> addAddress(
    String city,
    String region,
    String details,
    String notes,
  ) async {
    try {
      final response = await apiService.postData(
        endPoint: ApiEndPoints.address,
        data: {
          'name': 'Address',
          'city': city,
          'region': region,
          'details': details,
          'notes': notes,
          'latitude': 30.0,
          'longitude': 30.0,
        },
      );
      return right(EditAddressModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
