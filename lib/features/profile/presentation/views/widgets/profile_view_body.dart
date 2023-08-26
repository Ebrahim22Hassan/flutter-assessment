import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:flutter_assessment/core/utils/styles.dart';
import 'package:flutter_assessment/core/widgets/custom_text_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'mail_section.dart';
import '../../../../../core/widgets/profile_image_stack.dart';
import '../../../../../core/widgets/custom_rounded_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7.0, top: 15, right: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kEditProfileView);
                },
                text: "Edit",
                textColor: kPrimaryColor,
              ),
            ],
          ),
        ),
        ProfileImageStack(child: SvgPicture.asset(AssetsData.starIcon)),
        const SizedBox(height: 14),
        Text(
          "Abo Treka",
          style: Styles.textStyle14(FontWeight.w500),
        ),
        const SizedBox(height: 14),
        const MailSection(),
        const SizedBox(height: 22),
        const CustomRoundedButton(text: "Send Email")
      ],
    );
  }
}
