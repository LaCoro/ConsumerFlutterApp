import 'dart:convert';

import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/entities/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences _preferences;

  static const LAST_LATITUDE = 'lastLatitude';
  static const LAST_LONGITUDE = 'lastLongitude';
  static const SELECTED_CITY = 'selectedCity';

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

  Future saveCity(CityEntity city) async {
    await _preferences.setString(SELECTED_CITY, CityEntity.toJson(city).toString());
  }

  CityEntity getCity() {
    final cityJson = _preferences.getString(SELECTED_CITY);
    try {
      return CityEntity.fromJson(jsonDecode(cityJson));
    } catch (e) {
      return null;
    }
  }
}
