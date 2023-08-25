import 'package:flutter/material.dart';
import 'constants.dart';
import 'features/edit_profile/presentation/views/edit_profile_view.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/profile/presentation/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
      ),
      home: const EditProfileView(),
    );
  }
}
