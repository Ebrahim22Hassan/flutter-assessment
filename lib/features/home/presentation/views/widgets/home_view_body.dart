import 'package:flutter/material.dart';
import 'buttons_section.dart';
import 'contact_list_view.dart';
import 'image_section.dart';
import 'search_form_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchFormField(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 37, top: 20),
                  child: ButtonsSection(),
                ),
                //SizedBox(height: 108), // if list is empty
                SizedBox(height: 32), // if list is not empty
                //ImageSection(),
                Expanded(child: ContactsListView()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
