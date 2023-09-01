import 'package:equatable/equatable.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_assessment/features/home/domain/use_cases/fetch_contacts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.fetchContactsUseCase) : super(ContactsInitial());

  final FetchContactsUseCase fetchContactsUseCase;

  Future<void> fetchContacts() async {
    emit(ContactsLoadingState());
    var result = await fetchContactsUseCase.call();

    result.fold((failure) {
      emit(ContactsFailureState(failure.errorMessage));
    }, (contacts) {
      emit(ContactsSuccessState(contacts));
    });
  }

  Future<void> fetchOnlyLocalContacts() async {
    emit(ContactsLoadingState());
    var result = await fetchContactsUseCase.fetchOnlyLocalContacts();

    result.fold((failure) {
      emit(ContactsFailureState(failure.errorMessage));
    }, (contacts) {
      emit(ContactsSuccessState(contacts));
    });
  }

  Future<void> showFavoriteContacts() async {
    emit(ContactsLoadingState());
    var result = await fetchContactsUseCase.showFavoriteContacts();

    result.fold((failure) {
      emit(ContactsFailureState(failure.errorMessage));
    }, (contacts) {
      emit(ContactsSuccessState(contacts));
    });
  }

  void toggleFavoriteContact(ContactEntity contact) async {
    contact.isFavorite = !contact.isFavorite!;
    emit(FavoriteSuccessState(contact));

    emit(ContactsLoadingState());
    var result = await fetchContactsUseCase.fetchOnlyLocalContacts();

    result.fold((failure) {
      emit(ContactsFailureState(failure.errorMessage));
    }, (contacts) {
      emit(ContactsSuccessState(contacts));
    });
  }
}
