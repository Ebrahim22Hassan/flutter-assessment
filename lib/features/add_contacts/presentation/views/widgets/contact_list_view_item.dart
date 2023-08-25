import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.35,
            children: [
              SlidableAction(
                onPressed: (context) {},
                icon: FontAwesomeIcons.penToSquare,
                foregroundColor: const Color(0xffF2C94C),
                backgroundColor: kPrimaryColorWithOpacity,
              ),
              Container(
                color: kPrimaryColorWithOpacity,
                child: const VerticalDivider(
                  color: Color(0xffC5E2DE),
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                ),
              ),
              SlidableAction(
                onPressed: (context) {},
                icon: FontAwesomeIcons.trashCan,
                foregroundColor: Colors.red,
                backgroundColor: kPrimaryColorWithOpacity,
              ),
            ],
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
                onTap: () {},
                child: SvgPicture.asset(
                  AssetsData.messageIcon,
                )),
            contentPadding: const EdgeInsets.only(left: 8, right: 30),
          ),
        ),
      ),
    );
  }
}
