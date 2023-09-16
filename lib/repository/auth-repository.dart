import 'package:mvvm_architecture/data/network/base-api-services.dart';
import 'package:mvvm_architecture/data/network/network-api-service.dart';
import 'package:mvvm_architecture/res/app-endpoint.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppEndpoint.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppEndpoint.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
