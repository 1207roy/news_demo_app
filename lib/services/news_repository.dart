import 'dart:async';

import 'package:newsapp/models/models.dart';

abstract class NewsRepository {
  Future<NewsResponse> getNews();
}
