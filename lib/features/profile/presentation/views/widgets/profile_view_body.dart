import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/widgets/custom_text_button.dart';
import 'mail_section.dart';
import 'profile_image_stack.dart';
import 'send_email_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7.0, top: 15, right: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                onPressed: () {},
                text: "Edit",
                textColor: kPrimaryColor,
              ),
            ],
          ),
        ),
        const ProfileImageStack(),
        const SizedBox(height: 14),
        const MailSection(),
        const SizedBox(height: 22),
        const SendEmailButton()
      ],
    );
  }
}