import 'package:domain/entities/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences _preferences;

  static const LAST_LATITUDE = 'lastLatitude';
  static const LAST_LONGITUDE = 'lastLongitude';

  Future<Preferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future saveLocation(Location location) async {
    await _preferences.setDouble(LAST_LATITUDE, location.latitude);
    await _preferences.setDouble(LAST_LONGITUDE, location.longitude);
  }

  Location getLocation() {
    final lat = _preferences.getDouble(LAST_LATITUDE);
    final lng = _preferences.getDouble(LAST_LONGITUDE);
    return Location(lat, lng);
  }
}
