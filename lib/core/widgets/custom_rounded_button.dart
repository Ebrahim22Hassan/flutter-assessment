import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/styles.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 50),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {},
            child: Text(
              text,
              style: Styles.textStyle16(Colors.white),
            )),
      ),
    );
  }
}
