import 'package:equatable/equatable.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import 'package:flutter_assessment/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.homeRepo) : super(ContactsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchContacts() async {
    emit(ContactsLoadingState());
    var result = await homeRepo.fetchContacts();

    result.fold((failure) {
      emit(ContactsFailureState(failure.errorMessage));
    }, (contacts) {
      emit(ContactsSuccessState(contacts));
    });
  }
}
