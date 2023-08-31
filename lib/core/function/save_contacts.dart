import 'package:hive/hive.dart';
import '../../features/home/domain/entities/contact_entity.dart';

void saveContactsData(
    {required List<ContactEntity> contacts, required String boxName}) {
  var box = Hive.box<ContactEntity>(boxName);
  box.addAll(contacts);
}
