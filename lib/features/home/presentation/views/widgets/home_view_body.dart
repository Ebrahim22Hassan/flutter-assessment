import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/contacts_cubit/contacts_cubit.dart';
import 'buttons_section.dart';
import 'contact_list_view.dart';
import 'image_section.dart';
import 'search_form_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<ContactEntity> contacts = [];
  List<ContactEntity> contactsFiltered = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterContacts();
    });
  }

  void filterContacts() {
    List<ContactEntity> contactsList = [];
    contactsList.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      contactsList.retainWhere((element) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = element.firstName.toLowerCase();
        return contactName.contains(searchTerm);
      });
      setState(() {
        contactsFiltered = contactsList;
      });
    } else {
      setState(() {
        contactsFiltered = contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Column(
      children: [
        SearchFormField(textEditingController: searchController),
        Expanded(
          child: Container(
            color: Colors.white,
            child: BlocBuilder<ContactsCubit, ContactsState>(
                builder: (context, state) {
              if (state is ContactsSuccessState) {
                contacts = state.contacts;
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 37, top: 20),
                      child: ButtonsSection(),
                    ),
                    state.contacts.isNotEmpty
                        ? const SizedBox(height: 32)
                        : const SizedBox(height: 108),
                    state.contacts.isNotEmpty
                        ? Expanded(
                            child: ContactsListView(
                            contactsFiltered: contactsFiltered,
                            isSearching: isSearching,
                            contacts: state.contacts,
                          ))
                        : const ImageSection(),
                  ],
                );
              } else if (state is ContactsFailureState) {
                return Text(state.errMessage);
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ));
              }
            }),
          ),
        ),
      ],
    );
  }
}
