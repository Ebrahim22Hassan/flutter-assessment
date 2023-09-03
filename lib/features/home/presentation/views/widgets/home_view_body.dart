import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/function/filter_contacts.dart';
import '../../../../../core/utils/list_type.dart';
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

  ListType selectedListType = ListType.all;
  _onListTypeSelected(ListType type) {
    setState(() {
      selectedListType = type;
    });
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      List<ContactEntity> filteredList =
          filterContacts(contacts, searchController);
      setState(() {
        contactsFiltered = filteredList;
      });
    });
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
                    Padding(
                      padding: const EdgeInsets.only(left: 37, top: 20),
                      child: ButtonsSection(
                          selectedListType: selectedListType,
                          onSelected: _onListTypeSelected),
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
