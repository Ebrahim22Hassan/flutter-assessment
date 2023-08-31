import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:flutter_assessment/core/widgets/custom_rounded_button.dart';
import 'package:flutter_assessment/core/widgets/profile_image_stack.dart';
import 'package:flutter_assessment/features/edit_profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_assessment/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'edit_profile_form_field.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody(
      {Key? key, required this.contactEntity, required this.index})
      : super(key: key);
  final ContactEntity contactEntity;
  final int index;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  String? firstName, lastName, email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45, bottom: 30),
          child: ProfileImageStack(
              contactEntity: widget.contactEntity,
              child: SvgPicture.asset(AssetsData.editIcon)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              EditProfileFormField(
                label: "First Name",
                hint: widget.contactEntity.firstName,
                onChanged: (value) {
                  firstName = value;
                },
              ),
              const SizedBox(height: 20),
              EditProfileFormField(
                label: "Last Name",
                hint: widget.contactEntity.lastName ?? "",
                onChanged: (value) {
                  lastName = value;
                },
              ),
              const SizedBox(height: 20),
              EditProfileFormField(
                label: "Email",
                hint: widget.contactEntity.email,
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        CustomRoundedButton(
          text: "Done",
          onPressed: () {
            editContact(context);
            BlocProvider.of<ContactsCubit>(context).fetchContacts();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
          },
        ),
      ],
    );
  }

  void editContact(BuildContext context) {
    widget.contactEntity.firstName =
        firstName ?? widget.contactEntity.firstName;
    widget.contactEntity.lastName = lastName ?? widget.contactEntity.lastName;
    widget.contactEntity.email = email ?? widget.contactEntity.email;
    var contact = ContactEntity(
      email: widget.contactEntity.email,
      firstName: widget.contactEntity.firstName,
      lastName: lastName,
      avatar: widget.contactEntity.avatar,
      id: widget.contactEntity.id,
    );
    BlocProvider.of<EditProfileCubit>(context)
        .editContact(widget.index, contact);
  }
}
