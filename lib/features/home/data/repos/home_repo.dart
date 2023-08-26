import 'package:dartz/dartz.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ContactModel>>> fetchContacts();
}
