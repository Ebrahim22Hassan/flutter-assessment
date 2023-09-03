import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import 'contact_list_view_item.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.widget,
  });

  final ContactsListViewItem widget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
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
    );
  }
}
