part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileFailureState extends EditProfileState {
  final String errMessage;

  EditProfileFailureState(this.errMessage);
}

class EditProfileSuccessState extends EditProfileState {}
