import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../../../../constants.dart';
import '../../../domain/entities/contact_entity.dart';
part 'delete_contact_state.dart';

class DeleteContactCubit extends Cubit<DeleteContactState> {
  DeleteContactCubit() : super(DeleteContactInitial());

  deleteContact(int index) async {
    emit(DeleteContactLoadingState());
    try {
      var contactsBox = Hive.box<ContactEntity>(kContactsBox);
      await contactsBox.deleteAt(index);
      emit(DeleteContactSuccessState());
    } catch (e) {
      emit(DeleteContactFailureState(e.toString()));
    }
  }
}
