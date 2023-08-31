import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/function/clear_contact_box.dart';
import '../../../../../core/utils/assets.dart';
import '../../manager/contacts_cubit/contacts_cubit.dart';

class RefreshIcon extends StatelessWidget {
  const RefreshIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clearContactBox();
        BlocProvider.of<ContactsCubit>(context).fetchContacts();
      },
      child: Image.asset(AssetsData.unionIcon),
    );
  }
}
