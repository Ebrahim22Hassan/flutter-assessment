import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../edit_profile/presentation/views/edit_profile_view.dart';
import '../../../domain/entities/contact_entity.dart';
import 'delete_alert_dialog.dart';

class ContactsListViewItem extends StatefulWidget {
  const ContactsListViewItem(
      {Key? key, required this.contactEntity, required this.index})
      : super(key: key);
  final ContactEntity contactEntity;
  final int index;

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
        padding: const EdgeInsets.symmetric(vertical: 8),
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
                onPressed: (context) {
                  // GoRouter.of(context).push(
                  //   AppRouter.kEditProfileView,
                  // );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return EditProfileView(
                          index: widget.index,
                          contactEntity: widget.contactEntity);
                    },
                  ));
                },
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
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteAlertDialog(
                        index: widget.index,
                      );
                    },
                  );
                },
                icon: FontAwesomeIcons.trashCan,
                foregroundColor: Colors.red,
                backgroundColor: kPrimaryColorWithOpacity,
              ),
            ],
          ),
          child: ListTile(
            onLongPress: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            leading: CachedNetworkImage(
              placeholder: (context, url) => const SizedBox(
                height: 14,
                width: 14,
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: widget.contactEntity.avatar ?? kRFImage,
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  backgroundColor: Colors.transparent,
                  radius: 24,
                );
              },
            ),
            selected: isSelected,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16),
              child: Row(
                children: [
                  Text(
                    "${widget.contactEntity.firstName} ${widget.contactEntity.lastName ?? ""}",
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
                widget.contactEntity.email,
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff5a6883)),
              ),
            ),
            trailing: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProfileView(
                          contactEntity: widget.contactEntity,
                          index: widget.index);
                    },
                  ));
                  // GoRouter.of(context).push(
                  //   AppRouter.kProfileView,
                  //   extra: widget.contactEntity,
                  // );
                },
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
