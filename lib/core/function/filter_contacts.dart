import '../../features/home/domain/entities/contact_entity.dart';
import 'package:flutter/material.dart';

List<ContactEntity> filterContacts(
    List<ContactEntity> contacts, TextEditingController searchController) {
  List<ContactEntity> filteredContacts = [];

  filteredContacts.addAll(contacts);

  if (searchController.text.isNotEmpty) {
    String searchTerm = searchController.text.toLowerCase();

    filteredContacts.retainWhere((contact) {
      String firstName = contact.firstName.toLowerCase();
      String lastName = contact.lastName!.toLowerCase();

      return firstName.contains(searchTerm) || lastName.contains(searchTerm);
    });
  }

  return filteredContacts;
}
