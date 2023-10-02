import 'package:taskoctohub/Models/Login/Login.dart';

import '../../Data/network/ApiEndPoints.dart';
import '../../Data/network/BaseApiService.dart';
import '../../Data/network/NetworkApiService.dart';
import '../../Models/Login/ResgisterResponse.dart';

import 'GeneralRepo.dart';

class GeneralRepoImp implements GeneralRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<RegisterResponse> validateLogin(String body) async {
    try {
      dynamic response = await _apiService.getPostResponse(
          BaseApiService.base_url + ApiEndPoints().Regiter, body);
      print("Register Response $response");
      final jsonData = RegisterResponse.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
  Future<LoginResponse> loginApiResponse(String body) async {
    try {
      dynamic response = await _apiService.getPostResponse(
          'https://debug.devhub.in/api/Auth/login', body);
      print("Login Response $response");
      final jsonData = LoginResponse.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
