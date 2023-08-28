import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, required this.contactModel}) : super(key: key);
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        leadingIcon: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: ProfileViewBody(contactModel: contactModel),
    );
  }
}
