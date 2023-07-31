import 'dart:async';

import 'package:get/get.dart';
import 'package:medicalty/services/internet_connection.dart';

class ConnectionController extends GetxController {
  late InternetConnection _internetConnection;

  var _connState = InternetConnectionState.disConnected;
  StreamSubscription<InternetConnectionState>? _internetStream;

  ConnectionController() {
    _internetConnection = InternetConnection();

    listen();
  }

  bool get isOnline {
    return _connState == InternetConnectionState.connected;
  }

  InternetConnectionState get internetConnectionState {
    return _connState;
  }

  void reset() async {
    await _internetStream?.cancel();
    _connState = InternetConnectionState.disConnected;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    _internetConnection.dispose();
    _internetStream?.cancel();
  }

  void listen() {
    _internetStream =
        _internetConnection.listenToRealTimeConnection().listen((state) {
      if (_connState != state) {
        _connState = state;
        update();
      }
    });
  }
}
