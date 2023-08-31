import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/';
  // static const kProfileView = '/profileView';
  // static const kEditProfileView = '/editProfileView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: kProfileView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => ContactsCubit(
      //       FetchContactsUseCase(
      //         getIt.get<HomeRepoImplementation>(),
      //       ),
      //     ),
      //     child: ProfileView(
      //       contactEntity: state.extra as ContactEntity,
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: kEditProfileView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => ContactsCubit(
      //       FetchContactsUseCase(
      //         getIt.get<HomeRepoImplementation>(),
      //       ),
      //     ),
      //     child: EditProfileView(
      //       index: state.extra as int,
      //       contactEntity: state.extra as ContactEntity,
      //     ),
      //   ),
      // ),
    ],
  );
}
