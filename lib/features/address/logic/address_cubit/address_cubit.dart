import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/data/model/edit_address_model.dart';
import 'package:plaza/features/address/data/repos/address_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.addressRepo) : super(AddressInitialState());
  final AddressRepo addressRepo;

  Future<void> fetchAddress() async {
    emit(AddressLoadingState());
    final result = await addressRepo.fetchAddress();
    if (!isClosed)
      result.fold(
        (failure) {
          if (!isClosed) emit(AddressErrorState(failure.errMessage));
        },
        (address) {
          if (!isClosed) emit(AddressSuccessState(address));
        },
      );
  }

  Future<void> deleteAddress(int id) async {
    emit(DeleteAddressLoadingState());
    final result = await addressRepo.deleteAddress(id);
    if (!isClosed)
      result.fold(
        (failure) {
          if (!isClosed) emit(DeleteAddressErrorState(failure.errMessage));
        },
        (address) {
          if (!isClosed) emit(DeleteAddressSuccessState(address));
        },
      );
  }

  Future<void> addAddress(
    String city,
    String region,
    String details,
    String notes,
  ) async {
    emit(SaveAddressLoadingState());
    final result = await addressRepo.addAddress(city, region, details, notes);
    result.fold(
      (failure) {
        if (!isClosed) emit(SaveAddressErrorState(failure.errMessage));
      },
      (address) {
        if (!isClosed)
          emit(SaveAddressSuccessState(address.data as AddressData));
      },
    );
  }

  Future<void> editAddress(
    int id,
    String city,
    String region,
    String details,
    String notes,
  ) async {
    emit(SaveAddressLoadingState());
    final result = await addressRepo.editAddress(
      id,
      city,
      region,
      details,
      notes,
    );
    result.fold(
      (failure) {
        if (!isClosed) emit(SaveAddressErrorState(failure.errMessage));
      },
      (address) {
        if (!isClosed)
          emit(SaveAddressSuccessState(address.data as AddressData));
      },
    );
  }
}
