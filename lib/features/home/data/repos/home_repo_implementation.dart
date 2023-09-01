import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_assessment/features/home/domain/entities/contact_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImplementation implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<ContactEntity>>> fetchContacts() async {
    try {
      List<ContactEntity> contacts;
      contacts = homeLocalDataSource.fetchContacts();
      if (contacts.isNotEmpty) {
        return right(contacts);
      }
      contacts = await homeRemoteDataSource.fetchContacts();

      return right(contacts);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> fetchOnlyLocalContacts() async {
    try {
      List<ContactEntity> contacts;
      contacts = homeLocalDataSource.fetchContacts();

      return right(contacts);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> showFavoriteContacts() async {
    try {
      List<ContactEntity> contacts;
      contacts = homeLocalDataSource
          .fetchContacts()
          .where((element) => element.isFavorite ?? true)
          .toList();

      return right(contacts);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
