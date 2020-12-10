import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:newsapp/services/services.dart';

@LazySingleton(as: NewsClient)
class DefaultNewsClient extends NewsClientBase {
  @override
  String getDeviceOSName() {
    if (Platform.isIOS) {
      return 'IOS';
    } else if(Platform.isAndroid) {
      return 'Android';
    }
    return '';
  }
}
