import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taskoctohub/Models/Login/Login.dart';

import '../../Data/response/ApiResponse.dart';
import '../../Data/response/Status.dart';
import '../../Models/Login/ResgisterResponse.dart';

import '../../repository/Login/GeneralRepoImp.dart';


class LoginVM extends ChangeNotifier {
  final _myRepo = GeneralRepoImp();

  ApiResponse<RegisterResponse> registerResonse = ApiResponse.loading();
  ApiResponse<LoginResponse> loginResonse = ApiResponse.loading();
  void _setApiResponseToUI(ApiResponse<RegisterResponse> response) {
    registerResonse = response;
    registerResonse.data?.apiname = LoginEnum.REGISTER;
    notifyListeners();
  }

  Future<void> validateLogin(RegisterRequest body) async {
 print("Resqust = ${body}");
    _setApiResponseToUI(ApiResponse.loading());
    _myRepo
        .validateLogin(jsonEncode(body.toJson()))
        .then((value) => _setApiResponseToUI(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setApiResponseToUI(ApiResponse.error(error.toString())));
  }
  void _setloginResponseToUI(ApiResponse<LoginResponse> response) {
    loginResonse = response;
    loginResonse.data?.apiname = LoginEnum.LOGIN;
    notifyListeners();
  }

  Future<void> logindetail(LoginRequest body) async {
    print("login = ${body}");
    _setloginResponseToUI(ApiResponse.loading());
    _myRepo
        .loginApiResponse(jsonEncode(body.toJson()))
        .then((value) => _setloginResponseToUI(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
        _setloginResponseToUI(ApiResponse.error(error.toString())));
  }
}
