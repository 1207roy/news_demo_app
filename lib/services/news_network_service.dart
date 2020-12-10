import 'package:newsapp/models/models.dart';

abstract class NewsNetworkService {
  Future<NewsResponse> getNews(String country, String category, String apiKey);
}
