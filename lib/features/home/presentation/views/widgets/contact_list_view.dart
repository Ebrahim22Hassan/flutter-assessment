import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/styles.dart';
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
    final List<ContactEntity> displayedContacts =
        isSearching ? contactsFiltered : contacts;
    return displayedContacts.isEmpty
        ? Center(
            child: Text(
              isSearching ? 'No matching contacts' : 'No contacts available',
              style: Styles.textStyle16(Colors.black),
            ),
          )
        : ListView.builder(
            itemCount:
                isSearching == true ? contactsFiltered.length : contacts.length,
            itemBuilder: (context, index) {
              return ContactsListViewItem(
                index: index,
                contactEntity: isSearching == true
                    ? contactsFiltered[index]
                    : contacts[index],
              );
            },
          );
  }
}
