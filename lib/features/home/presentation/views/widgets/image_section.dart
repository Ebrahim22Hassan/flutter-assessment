import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:flutter_assessment/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 264,
          height: 264,
          child: SvgPicture.asset(AssetsData.vectorAmico),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 191,
          height: 34,
          child: Text(
            "No list of contact here, add contact now",
            textAlign: TextAlign.center,
            style: Styles.textStyle14(FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
