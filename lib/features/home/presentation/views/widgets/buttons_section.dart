import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/list_type.dart';
import '../../manager/contacts_cubit/contacts_cubit.dart';
import 'custom_button.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection(
      {Key? key, required this.selectedListType, required this.onSelected})
      : super(key: key);
  final ListType selectedListType;
  final ValueChanged<ListType> onSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: () {
            BlocProvider.of<ContactsCubit>(context).fetchOnlyLocalContacts();
            onSelected(ListType.all);
          },
          buttonColor:
              selectedListType == ListType.all ? kPrimaryColor : Colors.white,
          text: "All",
          textColor: selectedListType == ListType.all
              ? Colors.white
              : kButtonTextColor,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 24),
        CustomButton(
          onPressed: () {
            BlocProvider.of<ContactsCubit>(context).showFavoriteContacts();
            onSelected(ListType.favorite);
          },
          buttonColor: selectedListType == ListType.favorite
              ? kPrimaryColor
              : Colors.white,
          text: "Favourite",
          textColor: selectedListType == ListType.favorite
              ? Colors.white
              : kButtonTextColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
