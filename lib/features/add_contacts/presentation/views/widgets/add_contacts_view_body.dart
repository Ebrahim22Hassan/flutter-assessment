import 'package:flutter/material.dart';
import 'buttons_section.dart';
import 'image_section.dart';
import 'search_form_field.dart';

class AddContactsViewBody extends StatelessWidget {
  const AddContactsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchFormField(),
        Container(
          color: Colors.white,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 37, top: 20),
                child: ButtonsSection(),
              ),
              SizedBox(height: 108),
              ImageSection(),
            ],
          ),
        ),
      ],
    );
  }
}
