import 'package:equatable/equatable.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../domain/entities/contact_entity.dart';
part 'add_contacts_state.dart';

class AddContactsCubit extends Cubit<AddContactsState> {
  AddContactsCubit() : super(AddContactsInitial());

  addContact(ContactEntity contact) async {
    emit(AddContactsLoadingState());
    try {
      var contactsBox = Hive.box<ContactEntity>(kContactsBox);
      await contactsBox.add(contact);
      emit(AddContactsSuccessState());
    } catch (e) {
      emit(AddContactsFailureState(e.toString()));
    }
  }
}
