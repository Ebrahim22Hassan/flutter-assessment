part of 'contacts_cubit.dart';

abstract class ContactsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactsInitial extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsFailureState extends ContactsState {
  final String errMessage;

  ContactsFailureState(this.errMessage);
}

class ContactsSuccessState extends ContactsState {
  final List<ContactModel> contacts;

  ContactsSuccessState(this.contacts);
}