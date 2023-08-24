import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/add_contacts/presentation/views/widgets/app_fab.dart';
import 'widgets/add_contacts_view_body.dart';
import 'widgets/custom_app_bar.dart';

class AddContactsView extends StatelessWidget {
  const AddContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: AddContactsViewBody(),
      floatingActionButton: AppFAB(),
    );
  }
}
