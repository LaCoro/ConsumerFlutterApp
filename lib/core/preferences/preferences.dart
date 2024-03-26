import 'dart:convert';

import 'package:domain/entities/location.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late SharedPreferences _preferences;

  static const LAST_LATITUDE = 'lastLatitude';
  static const LAST_LONGITUDE = 'lastLongitude';
  static const SELECTED_CITY = 'selectedCity';
  static const SELECTED_ADDRESS = 'selectedAddress';
  static const LAST_ORDER = 'lastOrder';
  static const PROFILE = 'profile';

  Future<Preferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future saveLocation(Location location) async {
    await _preferences.setDouble(LAST_LATITUDE, location.latitude);
    await _preferences.setDouble(LAST_LONGITUDE, location.longitude);
  }

  Location? getLocation() {
    try {
      final lat = _preferences.getDouble(LAST_LATITUDE)!;
      final lng = _preferences.getDouble(LAST_LONGITUDE)!;
      return Location(lat, lng);
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveProfile(UserEntity? user) async {
    if (user == null) {
      return await _preferences.remove(PROFILE);
    } else {
      return await _preferences.setString(PROFILE, json.encode(UserEntity.toJsonObject(user)));
    }
  }

  UserEntity? getProfile() {
    final userJson = _preferences.getString(PROFILE);
    try {
      return UserEntity.fromJsonMap(json.decode(userJson!));
    } catch (e) {
      return null;
    }
  }

  Future saveLastOrder(OrderEntity? order) async {
    if (order == null) {
      return await _preferences.remove(LAST_ORDER);
    } else {
      return await _preferences.setString(LAST_ORDER, json.encode(OrderEntity.toJsonObject(order)));
    }
  }

  OrderEntity? getLastOrder() {
    final orderJson = _preferences.getString(LAST_ORDER);
    try {
      return OrderEntity.fromJsonMap(json.decode(orderJson!));
    } catch (e) {
      return null;
    }
  }
}
