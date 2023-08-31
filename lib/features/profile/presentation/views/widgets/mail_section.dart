import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import '../../../../../core/utils/styles.dart';

class MailSection extends StatelessWidget {
  const MailSection({
    super.key,
    required this.contactEntity,
  });
  final ContactEntity contactEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF1F1F1),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 13),
            child: Image.asset(AssetsData.mailIcon),
          ),
          Text(
            contactEntity.email,
            style: Styles.textStyle14(FontWeight.normal),
          )
        ],
      ),
    );
  }
}
