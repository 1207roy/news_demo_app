// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:newsapp/services/sharedpref_service.dart';
import 'package:newsapp/services/instant_local_persistence_service.dart';
import 'package:newsapp/services/default_news_client.dart';
import 'package:newsapp/services/news_client.dart';
import 'package:newsapp/services/network/news_network_service_impl.dart';
import 'package:newsapp/services/news_network_service.dart';
import 'package:newsapp/services/repositories/news_repository_impl.dart';
import 'package:newsapp/services/news_repository.dart';
import 'package:newsapp/services/repositories/setting_repository_impl.dart';
import 'package:newsapp/services/setting_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<InstantLocalPersistenceService>(
      () => SharedPrefService());
  g.registerLazySingleton<NewsClient>(() => DefaultNewsClient());
  g.registerLazySingleton<NewsNetworkService>(
      () => NewsNetworkServiceImpl(g<NewsClient>()));
  g.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(g<NewsNetworkService>()));
  g.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(g<InstantLocalPersistenceService>()));
}
