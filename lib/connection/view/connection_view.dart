import 'package:connectionapp/connection/conncetion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ConnectionStatus(),
      ),
    );
  }
}

class ConnectionStatus extends StatelessWidget {
  const ConnectionStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((ConnectionCubit cubit) => cubit.state);
    if (status is Connected && status.conType == ConType.wifi) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('you are connected with internet through'),
          Text(
            'WIFI',
            style: TextStyle(fontSize: 48),
          ),
          Icon(
            Icons.wifi_outlined,
            size: 108,
          ),
        ],
      );
    } else if (status is Connected && status.conType == ConType.mobile) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('you are connected with internet through'),
          Text(
            'MOBILE DATA',
            style: TextStyle(fontSize: 48),
          ),
          Icon(
            Icons.signal_cellular_alt,
            size: 108,
          ),
        ],
      );
    } else if (status is Disconnected) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('you are safe from'),
          Text(
            'INTERNET',
            style: TextStyle(fontSize: 48),
          ),
          Icon(
            Icons.wifi_off,
            size: 108,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 20,
            ),
          ),
          Icon(
            Icons.signal_cellular_off,
            size: 108,
          ),
        ],
      );
    }
    return const CircularProgressIndicator();
  }
}
