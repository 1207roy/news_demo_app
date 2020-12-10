import 'package:newsapp/services/services.dart';

/// This provides the base network service api for communicating with the network;
abstract class BaseNetworkService {
  final NewsClient client;

  BaseNetworkService(this.client);

  bool isSuccessful(int responseCode) => responseCode ~/ 100 == 2;
}
