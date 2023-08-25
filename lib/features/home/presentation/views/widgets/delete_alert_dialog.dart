import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/widgets/custom_text_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
  });

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
                  onPressed: () {},
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
