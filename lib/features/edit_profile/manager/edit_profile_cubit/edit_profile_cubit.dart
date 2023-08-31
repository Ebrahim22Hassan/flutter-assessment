import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../constants.dart';
import '../../../home/domain/entities/contact_entity.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  editContact(int index, ContactEntity contact) async {
    emit(EditProfileLoadingState());
    try {
      var contactsBox = Hive.box<ContactEntity>(kContactsBox);
      await contactsBox.putAt(index, contact);
      emit(EditProfileSuccessState());
    } catch (e) {
      emit(EditProfileFailureState(e.toString()));
    }
  }
}
