import 'package:dartz/dartz.dart';
import 'package:flutter_assessment/features/home/domain/repos/home_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/contact_entity.dart';

class FetchContactsUseCase extends UseCase<List<ContactEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchContactsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<ContactEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchContacts();
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> fetchOnlyLocalContacts(
      [NoParam? param]) async {
    return await homeRepo.fetchOnlyLocalContacts();
  }
}
