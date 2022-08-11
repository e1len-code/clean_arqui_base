import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  /* Future<bool> get isConnected; */
  String get url;

  set url(String newValue);

  get isConnected => null;
}

class NetworkInfoImpl implements NetworkInfo {
  //final DataConnectionChecker connectionChecker;
  final Connectivity connectivity;
  String _url;
  NetworkInfoImpl(/* this.connectionChecker,  */ this.connectivity, this._url);

  @override
  Future<bool>
      get isConnected => /* connectionChecker.hasConnection */ /* Future
      .value(true) */
          isConnectedToNetwork();
  @override
  // TODO: implement url
  String get url => this._url;

  @override
  set url(String newValue) {
    this._url = newValue;
  }

  Future<bool> isConnectedToNetwork() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on Exception {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        /* case ConnectivityResult.none: */
        return true;
      default:
        return false;
    }
  }
}
