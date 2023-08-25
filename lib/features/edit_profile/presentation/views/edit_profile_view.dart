import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/widgets/custom_app_bar.dart';
import 'widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        leadingIcon: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const EditProfileViewBody(),
    );
  }
}
