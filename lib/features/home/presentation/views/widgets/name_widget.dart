import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/assets.dart';
import 'contact_list_view_item.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.widget,
  });

  final ContactsListViewItem widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 16),
      child: Row(
        children: [
          Text(
            "${widget.contactEntity.firstName} ${widget.contactEntity.lastName ?? ""}",
            style: GoogleFonts.raleway(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(width: 4),
          widget.contactEntity.isFavorite!
              ? SvgPicture.asset(AssetsData.starIcon)
              : Container(),
        ],
      ),
    );
  }
}
