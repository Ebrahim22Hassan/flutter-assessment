import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../features/home/data/models/contact_model.dart';

void saveContactsData(List<ContactModel> contacts) {
  var box = Hive.box(kContactBox);
  box.addAll(contacts);
}
