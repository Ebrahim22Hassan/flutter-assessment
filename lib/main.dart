import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import 'package:flutter_assessment/features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_implementation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>(kContactBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchContacts(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Flutter Assessment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
          ),
        ),
        //home: const EditProfileView(),
      ),
    );
  }
}
