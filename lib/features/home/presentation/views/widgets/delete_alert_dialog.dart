import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/widgets/custom_text_button.dart';
import 'package:flutter_assessment/features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'package:flutter_assessment/features/home/presentation/manager/delete_contact_cubit/delete_contact_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      title: Text(
        "Are you sure you want to delete this contact?",
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 1.5,
        ),
      ),
      actions: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              height: 2,
              color: const Color(0xffDCDCDC), // The vertical divider color
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextButton(
                  onPressed: () {
                    BlocProvider.of<DeleteContactCubit>(context)
                        .deleteContact(index);
                    BlocProvider.of<ContactsCubit>(context)
                        .fetchOnlyLocalContacts();
                    Navigator.pop(context);
                  },
                  text: 'Yes',
                  textColor: Colors.red,
                ),
                Container(
                  width: 2,
                  height: 60,
                  color: const Color(0xffDCDCDC), // The vertical divider color
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "No",
                  textColor: kPrimaryColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
