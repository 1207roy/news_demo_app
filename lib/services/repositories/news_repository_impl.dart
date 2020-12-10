import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/services/services.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._newsNetworkService);

  final NewsNetworkService _newsNetworkService;

  @override
  Future<NewsResponse> getNews() {
    final apiKey = 'a4b97f5dd7dd4798bfee7067a3ec323b';
    final country = 'us';
    final category = 'business';
    return _newsNetworkService.getNews(country, category, apiKey);
  }
}
