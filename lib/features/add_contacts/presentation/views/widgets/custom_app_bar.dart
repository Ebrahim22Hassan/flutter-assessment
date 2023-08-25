import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My Contacts",
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      centerTitle: true,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 21),
          width: 20,
          child: GestureDetector(
              onTap: () {}, child: Image.asset(AssetsData.unionIcon)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
