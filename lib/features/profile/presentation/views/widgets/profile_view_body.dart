import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:flutter_assessment/core/utils/styles.dart';
import 'package:flutter_assessment/core/widgets/custom_text_button.dart';
import 'package:flutter_assessment/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../home/domain/entities/contact_entity.dart';
import 'mail_section.dart';
import '../../../../../core/widgets/profile_image_stack.dart';
import '../../../../../core/widgets/custom_rounded_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody(
      {Key? key, required this.contactEntity, required this.index})
      : super(key: key);
  final ContactEntity contactEntity;
  final int index;

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
                  // GoRouter.of(context).push(
                  //   AppRouter.kEditProfileView,
                  // );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return EditProfileView(
                          index: index, contactEntity: contactEntity);
                    },
                  ));
                },
                text: "Edit",
                textColor: kPrimaryColor,
              ),
            ],
          ),
        ),
        ProfileImageStack(
            contactEntity: contactEntity,
            child: SvgPicture.asset(AssetsData.starIcon)),
        const SizedBox(height: 14),
        Text(
          "${contactEntity.firstName} ${contactEntity.lastName!}",
          style: Styles.textStyle14(FontWeight.w500),
        ),
        const SizedBox(height: 14),
        MailSection(contactEntity: contactEntity),
        const SizedBox(height: 22),
        const CustomRoundedButton(text: "Send Email"),
      ],
    );
  }
}
