part of 'delete_contact_cubit.dart';

abstract class DeleteContactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteContactInitial extends DeleteContactState {}

class DeleteContactLoadingState extends DeleteContactState {}

class DeleteContactFailureState extends DeleteContactState {
  final String errMessage;

  DeleteContactFailureState(this.errMessage);
}

class DeleteContactSuccessState extends DeleteContactState {}
