import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/home/presentation/manager/add_contacts_cubit/add_contacts_cubit.dart';
import 'package:flutter_assessment/features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_contact_form.dart';

class AddContactBottomSheet extends StatelessWidget {
  const AddContactBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddContactsCubit(),
      child: BlocConsumer<AddContactsCubit, AddContactsState>(
        listener: (context, state) {
          if (state is AddContactsFailureState) {}

          if (state is AddContactsSuccessState) {
            BlocProvider.of<ContactsCubit>(context).fetchContacts();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddContactsLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddContactForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
