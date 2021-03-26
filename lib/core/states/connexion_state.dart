enum ConnectionState {
  INITIAL,
  CONNECTING,
  CONNECTED,
  ERROR,
}

abstract class ListenerConnectionState {
  void setState(ConnectionState state);
  ConnectionState get state;
}