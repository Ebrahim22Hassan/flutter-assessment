import 'package:flutter/material.dart';
import '../../../data/models/contact_model.dart';
import 'contact_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView(
      {Key? key,
      required this.isSearching,
      required this.contactsFiltered,
      required this.contacts})
      : super(key: key);
  final bool isSearching;
  final List<ContactModel> contactsFiltered;
  final List<ContactModel> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          isSearching == true ? contactsFiltered.length : contacts.length,
      itemBuilder: (context, index) {
        return ContactsListViewItem(
          contactModel:
              isSearching == true ? contactsFiltered[index] : contacts[index],
        );
      },
    );
  }
}
