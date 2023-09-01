import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import '../../constants.dart';
import '../utils/styles.dart';

void favoriteModalSheet({
  required BuildContext context,
  void Function()? onTap,
  required ContactEntity contactEntity,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            color: Colors.teal,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: kPrimaryColor,
                  child: ListTile(
                    title: Text(
                      contactEntity.isFavorite!
                          ? "Remove From Favourite"
                          : "Add To Favourite",
                      style: Styles.textStyle14(FontWeight.w600),
                    ),
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
