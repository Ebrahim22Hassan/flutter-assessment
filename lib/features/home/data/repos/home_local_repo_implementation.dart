import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import 'package:flutter_assessment/features/home/data/repos/home_local_repo.dart';
import 'package:hive/hive.dart';

class HomeLocalRepoImplementation implements HomeLocalRepo {
  @override
  List<ContactModel> fetchContacts() {
    var box = Hive.box<ContactModel>(kContactBox);

    return box.values.toList();
  }
}
