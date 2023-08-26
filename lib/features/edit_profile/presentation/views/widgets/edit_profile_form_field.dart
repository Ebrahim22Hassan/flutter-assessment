import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/styles.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField({Key? key, required this.label}) : super(key: key);
  final String label;
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
          decoration: InputDecoration(
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
