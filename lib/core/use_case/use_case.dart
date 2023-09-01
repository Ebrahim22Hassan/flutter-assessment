import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
  Future<Either<Failure, Type>> fetchOnlyLocalContacts([Param param]);
  Future<Either<Failure, Type>> showFavoriteContacts([Param param]);
}

class NoParam {}
