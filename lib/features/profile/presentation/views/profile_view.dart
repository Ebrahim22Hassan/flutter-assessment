import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/data/repos/home_repo_implementation.dart';
import '../../../home/domain/entities/contact_entity.dart';
import '../../../home/domain/use_cases/fetch_contacts_use_case.dart';
import '../../../home/presentation/manager/contacts_cubit/contacts_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
      {Key? key, required this.contactEntity, required this.index})
      : super(key: key);
  final ContactEntity contactEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsCubit(
        FetchContactsUseCase(
          getIt.get<HomeRepoImplementation>(),
        ),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Profile',
          leadingIcon: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: ProfileViewBody(index: index, contactEntity: contactEntity),
      ),
    );
  }
}
