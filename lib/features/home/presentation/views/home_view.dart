import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/home/presentation/views/widgets/refresh_icon.dart';
import 'widgets/app_fab.dart';
import 'widgets/home_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'My Contacts',
        actionIcon: RefreshIcon(),
      ),
      body: HomeViewBody(),
      floatingActionButton: AppFAB(),
    );
  }
}
