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

class EditAddressLoadingState extends AddressState {}

class EditAddressSuccessState extends AddressState {
  final EditAddressModel addressModel;
  const EditAddressSuccessState(this.addressModel);
}

class EditAddressErrorState extends AddressState {
  final String error;
  const EditAddressErrorState(this.error);
}

class EditAddressState extends AddressState {}
