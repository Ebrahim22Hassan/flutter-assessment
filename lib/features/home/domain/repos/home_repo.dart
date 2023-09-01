import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/contact_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ContactEntity>>> fetchContacts();
  Future<Either<Failure, List<ContactEntity>>> fetchOnlyLocalContacts();
}
