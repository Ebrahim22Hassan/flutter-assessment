import 'package:flutter/material.dart';

import 'contact_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ContactsListViewItem();
      },
    );
  }
}
