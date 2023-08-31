part of 'add_contacts_cubit.dart';

abstract class AddContactsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContactsInitial extends AddContactsState {}

class AddContactsLoadingState extends AddContactsState {}

class AddContactsFailureState extends AddContactsState {
  final String errMessage;

  AddContactsFailureState(this.errMessage);
}

class AddContactsSuccessState extends AddContactsState {}
