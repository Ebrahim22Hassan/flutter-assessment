import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/assets.dart';
import 'widgets/app_fab.dart';
import 'widgets/home_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'My Contacts', icon: Image.asset(AssetsData.unionIcon)),
      body: const HomeViewBody(),
      floatingActionButton: const AppFAB(),
    );
  }
}
