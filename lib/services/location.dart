import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
//      Position position = await Geolocator()
//          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
