import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/core/utils/assets.dart';

class ProfileImageStack extends StatelessWidget {
  const ProfileImageStack({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: const [
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 60,
                ),
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 55,
                  backgroundImage: AssetImage(AssetsData.testImage),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 5,
                end: 5,
              ),
              child: SizedBox(height: 25, width: 27, child: child),
            ),
          ],
        ),
      ],
    );
  }
}
