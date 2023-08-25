import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';

import 'custom_button.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: () {},
          buttonColor: Colors.white,
          text: "All",
          textColor: kButtonTextColor,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 24),
        CustomButton(
          onPressed: () {},
          buttonColor: kPrimaryColor,
          text: "Favourite",
          textColor: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
