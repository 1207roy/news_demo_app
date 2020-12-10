import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:newsapp/common/mobx_provider.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/service_locator.dart';
import 'package:newsapp/services/services.dart';

part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store, Disposable {
  _NewsStoreBase({final NewsRepository newsRepository})
      : _newsRepository = newsRepository ?? locator<NewsRepository>() {
    _updateNews();
  }

  final NewsRepository _newsRepository;

  Timer timer;

  @observable
  Result<bool> _newsResult = Result.none();

  Result<bool> get newsResult => _newsResult;

  @observable
  NewsResponse _newsResponse;

  NewsResponse get newsResponse => _newsResponse;

  @observable
  DateTime _syncDate;

  DateTime get syncDate => _syncDate;

  @action
  void refresh() {
    _newsResult = null;
    _updateNews();
  }

  @action
  Future<void> _updateNews() async {
    if(_newsResult == Result.loading()) {
      return;
    }

    _newsResult = Result.loading();
    try {
      _newsResponse = await _newsRepository.getNews();

      if (_newsResponse != null) {
        _syncDate = DateTime.now();
        _newsResult = Result(true);
      }
    } catch (e, stackTrace) {
      _newsResult = Result.error(error: e, message: e.toString());
    }
  }

  updateTimer() {
    timer?.cancel();
    timer =  Timer.periodic(Duration(seconds: 60), (Timer t) => _updateNews());
  }

  cancelTimer() => timer?.cancel();
}
