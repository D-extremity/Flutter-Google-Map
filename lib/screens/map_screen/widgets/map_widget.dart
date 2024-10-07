import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sense/screens/map_screen/screens/map_screen.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.size,
    required this.mapType,
    required this.kGooglePlex,
    required Completer<GoogleMapController> controller,
    required this.widget,
  }) : _controller = controller;

  final Size size;
  final MapType mapType;
  final CameraPosition kGooglePlex;
  final Completer<GoogleMapController> _controller;
  final MapScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.8,
      width: double.infinity,
      child: GoogleMap(
        mapToolbarEnabled: true,
        mapType: mapType,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
              markerId: MarkerId("Your are here"),
              position: widget.ltlng)
        },
      ),
    );
  }
}
