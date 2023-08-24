import 'package:flutter/material.dart';
import 'search_form_field.dart';

class AddContactsViewBody extends StatelessWidget {
  const AddContactsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchFormField(),
      ],
    );
  }
}
