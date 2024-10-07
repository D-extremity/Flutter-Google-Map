import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_type_event.dart';
part 'map_type_state.dart';

class MapTypeBloc extends Bloc<MapTypeEvent, MapTypeState> {
  MapTypeBloc() : super(MapTypeInitial()) {
    on<MapTypeEvent>((event, emit) {
      emit(MapTypeHybridState());
    });

    on<MapTypeTerrainEvent>((event, emit) => emit(MapTypeTerrainState()));
    on<MapTypeSatelliteEvent>((event, emit) => emit(MapTypeSatelliteState()));
    on<MapTypeNormalEvent>((event, emit) => emit(MapTypeNormalState()));
  }
}
