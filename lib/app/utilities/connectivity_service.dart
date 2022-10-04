import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((result) {
      _lastResult = result;
    });
  }

  late ConnectivityResult _lastResult;

  bool get mobile => _lastResult == ConnectivityResult.mobile;

  bool get wifi => _lastResult == ConnectivityResult.wifi;

  Future<void> init() async {
    _lastResult = await Connectivity().checkConnectivity();
  }
}
