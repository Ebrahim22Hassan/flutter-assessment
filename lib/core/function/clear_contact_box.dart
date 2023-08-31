import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../features/home/domain/entities/contact_entity.dart';

Future<void> clearContactBox() async {
  var contactsBox = Hive.box<ContactEntity>(kContactsBox);
  await contactsBox.clear();
}
