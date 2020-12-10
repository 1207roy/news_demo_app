import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:newsapp/services/services.dart';

abstract class NewsClientBase implements NewsClient {
  NewsClientBase({http.Client client}) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  String addQueryParamsToUrl(
    String originalUrl,
    Map<String, dynamic> queryParams,
  ) {
    assert(originalUrl != null);
    var oldUrl = Uri.parse(originalUrl);
    var oldQueryParams = oldUrl.queryParameters;
    var newQueryParams = {
      ...oldQueryParams,
      if (queryParams != null && queryParams.isNotEmpty) ...queryParams,
    };
    var newUrl = oldUrl.replace(queryParameters: newQueryParams);
    return newUrl.toString();
  }

  @override
  Future<http.Response> get(url,
      {Map<String, String> headers,
      Map<String, dynamic> params}) async {
    var queryParams = <String, dynamic>{};
    if (params != null) {
      queryParams.addAll(params);
    }

    final newUrl = addQueryParamsToUrl(url, queryParams);
    return _client.get(Uri.decodeFull(newUrl), headers: headers);
  }
}
