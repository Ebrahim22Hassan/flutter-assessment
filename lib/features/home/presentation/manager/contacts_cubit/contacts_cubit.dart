import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import 'package:flutter_assessment/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../../constants.dart';
part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.homeRepo) : super(ContactsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchContacts() async {
    emit(ContactsLoadingState());
    bool isConnected = await isConnectedToNetwork();
    if (isConnected) {
      var result = await homeRepo.fetchContacts();

      result.fold((failure) {
        emit(ContactsFailureState(failure.errorMessage));
      }, (contacts) {
        // Clear existing data in local storage
        var box = Hive.box<ContactModel>(kContactBox);
        box.clear();

        // Add fetched data to local storage
        box.addAll(contacts);
        emit(ContactsSuccessState(contacts));
      });
    } else {
      // Fetch data from local storage (Hive)
      var box = Hive.box<ContactModel>(kContactBox);
      var contacts = box.values.toList();
      emit(ContactsSuccessState(contacts));
    }
  }

  Future<bool> isConnectedToNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
