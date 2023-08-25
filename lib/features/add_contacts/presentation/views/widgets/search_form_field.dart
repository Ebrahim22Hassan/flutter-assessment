import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';

import '../../../../../core/utils/assets.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 26, left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search Contact",
          hintStyle: const TextStyle(
            color: Color(0xff999999),
            fontFamily: kGilroyFont,
            fontSize: 16,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
          suffixIcon: Container(
            margin: const EdgeInsets.only(right: 20),
            width: 18,
            child: Image.asset(AssetsData.searchIcon),
          ),
          enabledBorder: buildOutlineInputBorder(Colors.transparent),
          focusedBorder: buildOutlineInputBorder(Colors.grey[300]),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(borderColor) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(50));
  }
}
