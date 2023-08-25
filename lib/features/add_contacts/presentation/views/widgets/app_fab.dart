import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import '../../../../../core/utils/assets.dart';

class AppFAB extends StatelessWidget {
  const AppFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, bottom: 18),
      child: FloatingActionButton(
        elevation: 30,
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: SizedBox(
          height: 20,
          child: Image.asset(AssetsData.addIcon),
        ),
      ),
    );
  }
}
