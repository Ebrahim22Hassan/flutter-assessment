import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';

import '../../../../../core/utils/assets.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({Key? key, required this.textEditingController})
      : super(key: key);
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 26, left: 20, right: 20),
      child: TextFormField(
        controller: textEditingController,
        cursorColor: kPrimaryColor,
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
            child: Image.asset(AssetsData.searchIcon),
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 18,
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
