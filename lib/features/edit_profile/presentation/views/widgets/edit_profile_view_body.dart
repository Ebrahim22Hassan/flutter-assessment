import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:flutter_assessment/core/widgets/custom_rounded_button.dart';
import 'package:flutter_assessment/core/widgets/profile_image_stack.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'form_fields_section.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 45, bottom: 30),
        //   child:
        //       ProfileImageStack(child: SvgPicture.asset(AssetsData.editIcon)),
        // ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 34),
          child: EditFormFieldsSection(),
        ),
        const CustomRoundedButton(text: "Done"),
      ],
    );
  }
}
