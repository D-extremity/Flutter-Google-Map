import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sense/screens/home_screens/services/geolocation_services.dart';
import 'package:ride_sense/screens/home_screens/utils/custom_bordered_box.dart';
import 'package:ride_sense/screens/home_screens/utils/custom_text_field.dart';
import 'package:ride_sense/screens/map_screen/screens/map_screen.dart';
import 'package:ride_sense/utils/toast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController locationController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Sense"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 4),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomTextField(
              size: size,
              locationController: locationController,
              onTap: () async {
                if (locationController.text.isNotEmpty) {
                  List<Location> locations =
                      await GeolocationServices.locationThroughAddress(
                          locationController.text.trim());
                  log(locations.first.toString());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MapScreen(
                            ltlng: LatLng(locations.first.latitude,
                                locations.first.longitude),
                          )));
                  return;
                }
                toast("Search field is empty", false);
              },
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            CustomBorderedBox(
              onTap: () async {
                await GeolocationServices.requestLocationPermission()
                    .then((bool isGranted) async {
                  if (isGranted) {
                    await GeolocationServices.currentPosition()
                        .then((Position? p) async {
                      if (p != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MapScreen(
                                  ltlng: LatLng(p.latitude, p.longitude),
                                )));
                      } 
                      
                    });
                  }
                });
              },
              size: size,
              s: "Detect Location Automatically",
              icon: Icons.pin_drop_outlined,
            )
          ],
        ),
      ),
    );
  }
}
