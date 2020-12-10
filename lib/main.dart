import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/app_component.dart';
import 'package:newsapp/main_core.dart';
import 'package:newsapp/services/app_component_interface.dart';
import 'package:newsapp/services/local_notification_manager_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocalNotificationManager();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    final components = AppComponentBase.build(AppComponent());
    runApp(NewsApp(components));
  });
}
