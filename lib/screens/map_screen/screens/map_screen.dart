import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sense/screens/map_screen/bloc/map_type_bloc.dart';
import 'package:ride_sense/screens/map_screen/widgets/custom_text.dart';
import 'package:ride_sense/screens/map_screen/widgets/map_widget.dart';
import 'package:ride_sense/screens/map_screen/widgets/option_widget.dart';

class MapScreen extends StatefulWidget {
  final LatLng ltlng;
  const MapScreen({super.key, required this.ltlng});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    CameraPosition kGooglePlex = CameraPosition(
      target: widget.ltlng,
      zoom: 18,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Sense Map"),
      ),
      body: BlocProvider(
        create: (context) => MapTypeBloc(),
        child: BlocBuilder<MapTypeBloc, MapTypeState>(
          builder: (context, state) {
            Text mapTypeHeading = getText("Map Mode : Hybrid",size,color: Colors.black);
            Widget mapWidget = MapWidget(
                size: size,
                mapType: MapType.hybrid,
                kGooglePlex: kGooglePlex,
                controller: _controller,
                widget: widget);
            if (state is MapTypeNormalState) {
              mapTypeHeading = getText("Map Mode : Normal",size,color: Colors.black);
              mapWidget = MapWidget(
                  size: size,
                  mapType: MapType.normal,
                  kGooglePlex: kGooglePlex,
                  controller: _controller,
                  widget: widget);
            }
            if (state is MapTypeHybridState) {
              mapTypeHeading = getText("Map Mode : Hybrid",size,color: Colors.black);
              mapWidget = MapWidget(
                  size: size,
                  mapType: MapType.hybrid,
                  kGooglePlex: kGooglePlex,
                  controller: _controller,
                  widget: widget);
            }
            if (state is MapTypeSatelliteState) {
              mapTypeHeading = getText("Map Mode : Satellite",size,color: Colors.black);
              mapWidget = MapWidget(
                  size: size,
                  mapType: MapType.satellite,
                  kGooglePlex: kGooglePlex,
                  controller: _controller,
                  widget: widget);
            }
            if (state is MapTypeTerrainState) {
              mapTypeHeading = getText("Map Mode : Terrain",size,color: Colors.black);
              mapWidget = MapWidget(
                  size: size,
                  mapType: MapType.terrain,
                  kGooglePlex: kGooglePlex,
                  controller: _controller,
                  widget: widget);
            }

            return Column(
              children: [
                mapTypeHeading,
                mapWidget,
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    optionWidget("Hybrid", true, () {
                      context.read<MapTypeBloc>().add(MapTypeHybridEvent());
                    }, size),
                    optionWidget("Normal", true, () {
                      context.read<MapTypeBloc>().add(MapTypeNormalEvent());
                    }, size),
                    optionWidget("Satellite", true, () {
                      context.read<MapTypeBloc>().add(MapTypeSatelliteEvent());
                    }, size),
                    optionWidget("Terrain", true, () {
                      context.read<MapTypeBloc>().add(MapTypeTerrainEvent());
                    }, size),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
