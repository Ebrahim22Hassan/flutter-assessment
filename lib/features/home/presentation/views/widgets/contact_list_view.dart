import 'package:flutter/material.dart';
import '../../../domain/entities/contact_entity.dart';
import 'contact_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({
    Key? key,
    required this.isSearching,
    required this.contactsFiltered,
    required this.contacts,
  }) : super(key: key);
  final bool isSearching;
  final List<ContactEntity> contactsFiltered;
  final List<ContactEntity> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          isSearching == true ? contactsFiltered.length : contacts.length,
      itemBuilder: (context, index) {
        return ContactsListViewItem(
          index: index,
          contactEntity:
              isSearching == true ? contactsFiltered[index] : contacts[index],
        );
      },
    );
  }
}
