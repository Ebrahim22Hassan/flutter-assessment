import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_assessment/features/home/presentation/manager/add_contacts_cubit/add_contacts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_rounded_button.dart';
import 'custom_text_field.dart';

class AddContactForm extends StatefulWidget {
  const AddContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? firstName, secondName, email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              firstName = value;
            },
            hint: 'First Name',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              secondName = value;
            },
            hint: 'Second Name',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              email = value;
            },
            hint: 'Email',
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddContactsCubit, AddContactsState>(
            builder: (context, state) {
              return CustomRoundedButton(
                text: "Add",
                isLoading: state is AddContactsLoadingState ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var contact = ContactEntity(
                      firstName: firstName!,
                      email: email!,
                      lastName: secondName!,
                      isFavorite: false,
                    );

                    BlocProvider.of<AddContactsCubit>(context)
                        .addContact(contact);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
