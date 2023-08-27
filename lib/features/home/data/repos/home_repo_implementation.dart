import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_assessment/core/utils/api_service.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import '../../../../core/errors/failure.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<ContactModel>>> fetchContacts() async {
    try {
      var data = await apiService.get(endPoint: "/users?page=1");

      List<ContactModel> contacts = [];
      for (var item in data['data']) {
        contacts.add(ContactModel.fromJson(item));
      }
      return right(contacts);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
