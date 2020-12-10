
import 'package:newsapp/service_locator.dart';
import 'package:newsapp/services/app_component_interface.dart';
import 'package:newsapp/services/services.dart';
import 'package:newsapp/services/setting_repository.dart';

class AppComponent implements AppComponentBase {

  AppComponent() {
    setupLocator();
  }

  @override
  NewsRepository getNewsRepository() => locator<NewsRepository>();

  @override
  SettingRepository getSettingRepository() => locator<SettingRepository>();

  @override
  InstantLocalPersistenceService getInstantLocalPersistenceService() => locator<InstantLocalPersistenceService>();
}
