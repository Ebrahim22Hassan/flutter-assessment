import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/styles.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField({
    Key? key,
    required this.label,
    required this.hint,
    this.onChanged,
  }) : super(key: key);
  final String label;
  final String hint;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(label, style: Styles.textStyle11(kPrimaryColor)),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            enabledBorder: buildOutlineInputBorder(kPrimaryColor),
            focusedBorder: buildOutlineInputBorder(kPrimaryColor),
          ),
          style: Styles.textStyle14(FontWeight.w500),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(borderColor) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(50));
  }
}
