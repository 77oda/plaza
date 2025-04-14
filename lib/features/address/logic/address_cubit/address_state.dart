part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressSuccessState extends AddressState {
  final AddressModel addressModel;
  const AddressSuccessState(this.addressModel);
}

class AddressErrorState extends AddressState {
  final String error;
  const AddressErrorState(this.error);
}

class DeleteAddressLoadingState extends AddressState {}

class DeleteAddressSuccessState extends AddressState {
  final EditAddressModel addressModel;
  const DeleteAddressSuccessState(this.addressModel);
}

class DeleteAddressErrorState extends AddressState {
  final String error;
  const DeleteAddressErrorState(this.error);
}

class SaveAddressLoadingState extends AddressState {}

class SaveAddressSuccessState extends AddressState {
  final AddressData addressData;
  const SaveAddressSuccessState(this.addressData);
}

class SaveAddressErrorState extends AddressState {
  final String error;
  const SaveAddressErrorState(this.error);
}

class ButtomActionState extends AddressState {
  final AddressData addressData;
  const ButtomActionState(this.addressData);
}
