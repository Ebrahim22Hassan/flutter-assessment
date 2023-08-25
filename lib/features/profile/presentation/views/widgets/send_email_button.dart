import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/styles.dart';

class SendEmailButton extends StatelessWidget {
  const SendEmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              minimumSize: const Size.fromHeight(50)),
          onPressed: () {},
          child: Text(
            "Send Email",
            style: Styles.textStyle16(Colors.white),
          )),
    );
  }
}
