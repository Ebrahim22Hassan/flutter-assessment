import 'package:flutter_assessment/core/utils/service_locator.dart';
import 'package:flutter_assessment/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import 'package:flutter_assessment/features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter_assessment/features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'package:flutter_assessment/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => ContactsCubit(
            getIt.get<HomeRepoImplementation>(),
          ),
          child: ProfileView(
            contactModel: state.extra as ContactModel,
          ),
        ),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
    ],
  );
}
