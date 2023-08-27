import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
        if (state is ContactsSuccessState) {
          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              return ContactsListViewItem(
                contactModel: state.contacts[index],
              );
            },
          );
        } else if (state is ContactsFailureState) {
          return Text(state.errMessage);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: kPrimaryColor,
          ));
        }
      },
    );
  }
}
