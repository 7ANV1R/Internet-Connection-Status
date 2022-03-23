part of 'connection_cubit.dart';

enum ConType { wifi, mobile }

@immutable
abstract class ConnectionState {}

class ConnectionInitial extends ConnectionState {}

class Connected extends ConnectionState {
  Connected({required this.conType});
  final ConType conType;
}

class Disconnected extends ConnectionState {}
