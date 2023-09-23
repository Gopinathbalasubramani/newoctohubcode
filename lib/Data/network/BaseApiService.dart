abstract class BaseApiService {
  static const String base_url = "https://debug.devhub.in/api/WebUser/";


 /* Future<dynamic> getResponse(String url);

  Future<dynamic> getResponseWithQueryParam(String url);
*/
  Future<dynamic> getPostResponse(String url, String body);

  /*Future<dynamic> getPostResponseWithoutBody(String url);

  Future<dynamic> getFormPostResponse(String url, String body);*/
}
