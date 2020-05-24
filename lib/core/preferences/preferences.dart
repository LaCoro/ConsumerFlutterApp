import 'dart:convert';

import 'package:domain/entities/address_entity.dart';
import 'package:domain/entities/location.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences _preferences;

  static const LAST_LATITUDE = 'lastLatitude';
  static const LAST_LONGITUDE = 'lastLongitude';
  static const SELECTED_CITY = 'selectedCity';
  static const SELECTED_ADDRESS = 'selectedAddress';
  static const PROFILE = 'profile';

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

  Future<bool> saveAddress(AddressEntity address) async {
    if (getProfile() != null) {
      await saveProfile(getProfile()..address = address.getFullAddress());
    }
    return await _preferences.setString(SELECTED_ADDRESS, json.encode(AddressEntity.toJsonObject(address)));
  }

  AddressEntity getAddress() {
    final addressJson = _preferences.getString(SELECTED_ADDRESS);
    try {
      return AddressEntity.fromJsonMap(json.decode(addressJson));
    } catch (e) {
      return null;
    }
  }

  Future saveProfile(UserEntity user) async {
    await _preferences.setString(PROFILE, json.encode(UserEntity.toJsonObject(user)));
  }

  UserEntity getProfile() {
    final userJson = _preferences.getString(PROFILE);
    try {
      return UserEntity.fromJsonMap(json.decode(userJson));
    } catch (e) {
      return null;
    }
  }
}
