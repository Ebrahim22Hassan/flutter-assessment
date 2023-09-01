import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/domain/entities/contact_entity.dart';
import '../../features/home/presentation/manager/contacts_cubit/contacts_cubit.dart';

void toggleFavoriteContact(BuildContext context, ContactEntity contactEntity) {
  BlocProvider.of<ContactsCubit>(context).toggleFavoriteContact(contactEntity);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: contactEntity.isFavorite!
          ? const Text('Contact added to Favourite')
          : const Text('Contact removed from Favourite'),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
}
