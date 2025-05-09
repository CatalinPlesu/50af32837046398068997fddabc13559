import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  void dispose();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({InternetConnectionChecker? connectionChecker})
    : connectionChecker =
          connectionChecker ?? InternetConnectionChecker.createInstance();

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  void dispose() {
    connectionChecker.dispose();
  }
}
