import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

enum InternetConnectionState {
  connected,
  disConnected,
}

class InternetConnection {
  // late Connectivity connectivity;
  late InternetConnectionChecker connectionChecker;
  late StreamSubscription<InternetConnectionStatus>
      _connectivityStreamSubscription;
  // late StreamSubscription<ConnectivityResult> _connectivityStreamSubscription;
  final _connectionState =
      StreamController<InternetConnectionState>.broadcast();

  InternetConnection(//{
      // required this.connectivity,
      //}
      ) {
    // connectivity = Connectivity();
    connectionChecker = InternetConnectionChecker();

    _monitorInternetConnection();
  }

  // StreamSubscription<ConnectivityResult> _monitorInternetConnection() {
  //   return _connectivityStreamSubscription =
  //       connectivity.onConnectivityChanged.listen((connectivityResult) {
  //     if (connectivityResult == ConnectivityResult.wifi ||
  //         connectivityResult == ConnectivityResult.mobile) {
  //       _connectionState.add(InternetConnectionState.connected);
  //     } else if (connectivityResult == ConnectivityResult.none) {
  //       _connectionState.add(InternetConnectionState.disConnected);
  //     }
  //   });
  // }

  StreamSubscription<InternetConnectionStatus> _monitorInternetConnection() {
    return _connectivityStreamSubscription =
        connectionChecker.onStatusChange.listen((connectivityResult) {
      if (connectivityResult == InternetConnectionStatus.connected) {
        _connectionState.add(InternetConnectionState.connected);
      } else if (connectivityResult == InternetConnectionStatus.disconnected) {
        _connectionState.add(InternetConnectionState.disConnected);
      }
    });
  }

  Stream<InternetConnectionState> listenToRealTimeConnection() {
    return _connectionState.stream;
  }

  void dispose() {
    _connectivityStreamSubscription.cancel();
    _connectionState.close();
  }
}
