part of 'map_type_bloc.dart';

@immutable
sealed class MapTypeState {}

final class MapTypeTerrainState extends MapTypeState{}
final class MapTypeNormalState extends MapTypeState{}
final class MapTypeSatelliteState extends MapTypeState{}
final class MapTypeHybridState extends MapTypeState{}