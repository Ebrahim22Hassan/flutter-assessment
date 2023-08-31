import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/widgets/custom_app_bar.dart';
import 'package:flutter_assessment/features/edit_profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView(
      {Key? key, required this.index, required this.contactEntity})
      : super(key: key);

  final int index;
  final ContactEntity contactEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: 'Profile',
          leadingIcon: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
            child: EditProfileViewBody(
                index: index, contactEntity: contactEntity)),
      ),
    );
  }
}
