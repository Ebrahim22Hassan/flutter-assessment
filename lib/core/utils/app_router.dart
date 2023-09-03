import 'package:flutter_assessment/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/edit_profile/presentation/views/edit_profile_view.dart';
import '../../features/home/data/repos/home_repo_implementation.dart';
import '../../features/home/domain/entities/contact_entity.dart';
import '../../features/home/domain/use_cases/fetch_contacts_use_case.dart';
import '../../features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';

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
        path: '$kProfileView/:index',
        builder: (context, state) => BlocProvider(
          create: (context) => ContactsCubit(
            FetchContactsUseCase(
              getIt.get<HomeRepoImplementation>(),
            ),
          ),
          child: ProfileView(
            index: int.parse(state.pathParameters['index'] as String),
            contactEntity: state.extra as ContactEntity,
          ),
        ),
      ),
      GoRoute(
        path: '$kEditProfileView/:index',
        builder: (context, state) => BlocProvider(
          create: (context) => ContactsCubit(
            FetchContactsUseCase(
              getIt.get<HomeRepoImplementation>(),
            ),
          ),
          child: EditProfileView(
            index: int.parse(state.pathParameters['index'] as String),
            contactEntity: state.extra as ContactEntity,
          ),
        ),
      ),
    ],
  );
}
