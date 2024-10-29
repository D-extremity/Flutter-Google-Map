part of 'map_type_bloc.dart';

@immutable
sealed class MapTypeEvent {}
final class MapTypeInitial extends MapTypeState {}
final class MapTypeTerrainEvent extends MapTypeEvent{
  
}
final class MapTypeNormalEvent extends MapTypeEvent{}
final class MapTypeSatelliteEvent extends MapTypeEvent{}
final class MapTypeHybridEvent extends MapTypeEvent{}