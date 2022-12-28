part of 'config_bloc.dart';

abstract class ConfigEvent {
  const ConfigEvent();
}

class ConfigGetLast extends ConfigEvent {}

class ConfigWatch extends ConfigEvent {
  final int key;

  const ConfigWatch({
    required this.key,
  });
}

class ConfigChanged extends ConfigEvent {
  final Config data;

  const ConfigChanged({
    required this.data,
  });
}

class ConfigUpdate extends ConfigEvent {
  final String? internalUrl;
  final String? accessTocken;

  const ConfigUpdate({
    this.internalUrl,
    this.accessTocken,
  });
}

class ConfigTryConnect extends ConfigEvent {
  const ConfigTryConnect();
}
