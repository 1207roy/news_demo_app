import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/services/base_network_service.dart';
import 'package:newsapp/services/services.dart';

@LazySingleton(as: NewsNetworkService)
class NewsNetworkServiceImpl extends BaseNetworkService implements NewsNetworkService {
  NewsNetworkServiceImpl(NewsClient client) : super(client);

  String newsAPIBaseURL = "http://newsapi.org/v2/top-headlines/";

  @override
  Future<NewsResponse> getNews(String country, String category, String apiKey) async {
    assert(apiKey != null);
    var requestUrl = newsAPIBaseURL;

    final requestParams = {
      "country": country ?? 'us',
      "category": category ?? 'business',
      'apiKey': apiKey,
    };

    try {
      final response = await client.get(requestUrl, params: requestParams);

      if (isSuccessful(response.statusCode)) {
        return NewsResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error while calling the getNews after getting response');
      }
    } catch (e, _) {
      throw e;
    }
  }
}
