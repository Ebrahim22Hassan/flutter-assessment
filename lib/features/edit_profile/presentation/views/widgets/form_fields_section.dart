import 'package:flutter/material.dart';
import 'edit_profile_form_field.dart';

class EditFormFieldsSection extends StatelessWidget {
  const EditFormFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        EditProfileFormField(label: "First Name"),
        SizedBox(height: 20),
        EditProfileFormField(label: "Last Name"),
        SizedBox(height: 20),
        EditProfileFormField(label: "Email"),
        SizedBox(height: 20),
      ],
    );
  }
}
