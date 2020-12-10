import 'package:http/http.dart' as http;

abstract class NewsClient {
  String getDeviceOSName();

  String addQueryParamsToUrl(
    String originalUrl,
    Map<String, dynamic> queryParams,
  );

  Future<http.Response> get(String url,
      {Map<String, String> headers,
      Map<String, dynamic> params});
}
