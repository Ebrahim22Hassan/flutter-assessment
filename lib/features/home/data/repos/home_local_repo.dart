import '../models/contact_model.dart';

abstract class HomeLocalRepo {
  List<ContactModel> fetchContacts();
}
