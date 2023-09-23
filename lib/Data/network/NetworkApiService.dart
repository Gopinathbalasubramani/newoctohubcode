import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart' as encryptedLib;

import 'package:http/http.dart' as http;

import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {






  @override
  Future getPostResponse(String url, String body) async {
    dynamic responseJson;

    try {

      Map<String, String> headers;
      String sessionKey = '';




print('object$sessionKey');
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Token": sessionKey
        };


      final response = await http
          .post(
        Uri.parse(url),
        body: body,
        headers: headers,
      )
          /*.interceptWithAlice()*/
          .timeout(
        const Duration(seconds: 60),
        onTimeout: () {

          return http.Response('Timeout', 200);
        },
      );
      //Utils.displayLogsInDebugMode("login response: " + response.body);
      responseJson = returnResponse(response);
      print("response: ${response.body}");
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:

        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:

        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 403:

        throw UnauthorisedException(response.body.toString());
      case 500:

        throw UnauthorisedException(response.body.toString());
      case 404:

        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:

        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
    }
  }
}

/*
getQuestionsDetails() async {
  try {
    Future.delayed(Duration.zero, () async {
      String? sessionKey = "";
      var sessionKeyTemp = await _storage.read(
          key: 'sessionKey', aOptions: Utils.getAndroidOptions());
      var sessionKeyData = Utils.convertToBase64ifNotConverted(
          sessionKeyTemp ?? Utils.defaultObj(" "), 'sessionKey');

      sessionKey = Utils.generateEncryptorObj().decrypt(
          encryptedLib.Encrypted.fromBase64(
              sessionKeyData ?? Utils.defaultObj(" ")));

      EasyLoading.show(status: '');
      var questionsWhere = QuestionsWhere();
      var databody = QuestionsRequest(
          where: questionsWhere
      );
      var bodyString = json.encode(databody);
      final response = await http.get(Uri.parse('${BaseApiService.base_url}${ApiEndPoints().questionList}filter=$bodyString'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "access-token": sessionKey
          });
      Utils.displayLogsInDebugMode('QuestionsList URL :$questionsList');
      var quesList = jsonDecode(response.body);
      questionsList =List<QuestionsResponse>.from(quesList.map((i) => QuestionsResponse.fromJson(i)));
      Utils.displayLogsInDebugMode('QuestionsList:${questionsList}');
      EasyLoading.dismiss();
    });
  } catch (Exception) {
    print(Exception);
  }
}
*/
