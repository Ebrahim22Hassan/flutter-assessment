import 'package:flutter_assessment/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:flutter_assessment/features/profile/presentation/views/profile_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/';
  static const kProfileView = '/profileView';
  static const kEditProfileView = '/editProfileView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
    ],
  );
}
