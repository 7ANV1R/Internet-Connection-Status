import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit({required this.connectivity}) : super(ConnectionInitial()) {
    connectivityStreamSub = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emit(Connected(conType: ConType.wifi));
      } else if (event == ConnectivityResult.mobile) {
        emit(Connected(conType: ConType.mobile));
      } else if (event == ConnectivityResult.none) {
        emit(Disconnected());
      }
    });
  }

  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSub;

  void emitInternetConnected(ConType contype) {
    emit(Connected(conType: contype));
  }

  void emitInternetDisconnected() {
    emit(Disconnected());
  }

  @override
  Future<void> close() {
    connectivityStreamSub.cancel();
    return super.close();
  }
}
