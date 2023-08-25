import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';

class ContactsListViewItem extends StatefulWidget {
  const ContactsListViewItem({Key? key}) : super(key: key);

  @override
  State<ContactsListViewItem> createState() => _ContactsListViewItemState();
}

class _ContactsListViewItemState extends State<ContactsListViewItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? kPrimaryColorWithOpacity : Colors.transparent,
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          leading: const CircleAvatar(
            backgroundImage: AssetImage(AssetsData.testImage),
            radius: 24,
            backgroundColor: Colors.transparent,
          ),
          selected: isSelected,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
            child: Row(
              children: [
                Text(
                  "Abo Treka",
                  style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(AssetsData.starIcon),
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
            child: Text(
              "abotreka@gmail.com",
              style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff5a6883)),
            ),
          ),
          trailing: GestureDetector(
              onTap: () {}, child: SvgPicture.asset(AssetsData.messageIcon)),
          contentPadding:
              const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 30),
        ),
      ),
    );
  }
}
