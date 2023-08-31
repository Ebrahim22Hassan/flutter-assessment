import 'package:flutter_assessment/constants.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/contact_entity.dart';

abstract class HomeLocalDataSource {
  List<ContactEntity> fetchContacts();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<ContactEntity> fetchContacts() {
    var box = Hive.box<ContactEntity>(kContactsBox);
    return box.values.toList();
  }
}
