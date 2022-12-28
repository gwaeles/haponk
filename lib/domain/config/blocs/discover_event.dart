part of '../../../domain/config/blocs/discover_bloc.dart';

abstract class DiscoverEvent {
  const DiscoverEvent();
}

class DiscoverStart extends DiscoverEvent {}

class DiscoverDiscovered extends DiscoverEvent {
  final String data;

  const DiscoverDiscovered(this.data);
}

class DiscoverStop extends DiscoverEvent {}
