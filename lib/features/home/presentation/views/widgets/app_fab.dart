import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import '../../../../../core/utils/assets.dart';
import 'add_contact_bottom_sheet.dart';

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
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddContactBottomSheet();
              });
        },
        backgroundColor: kPrimaryColor,
        child: SizedBox(
          height: 20,
          child: Image.asset(AssetsData.addIcon),
        ),
      ),
    );
  }
}
