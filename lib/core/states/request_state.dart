enum RequestState {
  INITIAL,
  LOADING,
  LOADED,
  ERROR
}

abstract class ListenerRequestState {
  void setState(RequestState state);
  RequestState get state;
}