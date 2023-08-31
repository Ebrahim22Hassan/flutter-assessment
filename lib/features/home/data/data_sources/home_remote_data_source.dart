import 'package:flutter_assessment/core/function/save_contacts.dart';
import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../domain/entities/contact_entity.dart';
import '../models/contact_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ContactEntity>> fetchContacts();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<ContactEntity>> fetchContacts() async {
    var data = await apiService.get(endPoint: getContactsEndPoint);

    List<ContactEntity> contacts = getContactsList(data);
    saveContactsData(contacts: contacts, boxName: kContactsBox);
    return contacts;
  }

  List<ContactEntity> getContactsList(Map<String, dynamic> data) {
    List<ContactEntity> contacts = [];
    for (var item in data['data']) {
      contacts.add(ContactModel.fromJson(item));
    }
    return contacts;
  }
}
