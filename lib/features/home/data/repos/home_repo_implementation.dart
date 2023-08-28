import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_assessment/core/utils/api_service.dart';
import 'package:flutter_assessment/features/home/data/models/contact_model.dart';
import '../../../../constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/save_data_function.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<ContactModel>>> fetchContacts() async {
    try {
      var data = await apiService.get(endPoint: getContactsEndPoint);

      List<ContactModel> contacts = [];
      for (var item in data['data']) {
        contacts.add(ContactModel.fromJson(item));
      }
      // save data locally
      saveContactsData(contacts);

      return right(contacts);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
