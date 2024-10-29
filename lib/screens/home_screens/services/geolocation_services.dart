import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ride_sense/utils/toast.dart';

class GeolocationServices {
  static Future<Position?> currentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      log(e.toString());
      toast("Entered Location not found", false);

      return null;
    }
  }

  static Future<bool> requestLocationPermission() async {
    var result = await Permission.location.request();
    if (result.isGranted) {
      toast("Fetching Location", true);
      return true;
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      toast("Locatoion Permission Denied", false);
      return false;
    }
  }

  static Future<List<Location>> locationThroughAddress(String address) async {
    try {
      return await locationFromAddress(address);
    } catch (e) {
      log(e.toString());
      toast("Entered Location not found", false);
      return  <Location>[];
    }
  }
}
