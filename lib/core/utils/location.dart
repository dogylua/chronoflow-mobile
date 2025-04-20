import 'package:geolocator/geolocator.dart';

class Location {
  static Future<Map<String, dynamic>> getLocationInfo() async {
    Map<String, dynamic> locationData = {};

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationData = {
          'error': 'Location services are disabled',
        };
        return locationData;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationData = {
            'error': 'Location permissions are denied',
          };
          return locationData;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationData = {
          'error': 'Location permissions are permanently denied',
        };
        return locationData;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      locationData = {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
        'altitude': position.altitude,
        'speed': position.speed,
        'heading': position.heading,
        'timestamp': position.timestamp?.millisecondsSinceEpoch,
      };
    } catch (e) {
      locationData = {
        'error': 'Failed to get location: $e',
      };
    }

    return locationData;
  }
}
