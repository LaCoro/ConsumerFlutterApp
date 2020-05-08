import 'dart:async';

import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:domain/entities/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectAddressMapPage extends StatefulWidget {
  static const SELECT_ADDRESS_MAP_ROUTE = '/select_address_map';

  @override
  _SelectAddressMapPageState createState() => _SelectAddressMapPageState();
}

class _SelectAddressMapPageState extends State<SelectAddressMapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  // TODO  Move this inside the bloc
  CameraPosition initialPos() {
    final Preferences pref = Injector.getInjector().get();
    final location = pref.getLocation();
    return location != null ? CameraPosition(target: LatLng(location.latitude, location.latitude)) : null;
  }

  @override
  void initState() {
    loadCurrentLocation();
    super.initState();
  }

  Future<void> loadCurrentLocation() async {
    await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) async {
      // TODO move this inside the bloc
      final Preferences pref = Injector.getInjector().get();
      pref.saveLocation(Location(value.latitude, value.longitude));
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(zoom: 18, target: LatLng(value.latitude, value.longitude)),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                shadowColor: AppColors.greyMedium,
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: strings.searchYourAddress,
                        hintStyle: Theme.of(context).textTheme.caption,
                        prefixIcon: Icon(Icons.search, color: AppColors.greyMedium, size: 24),
                        suffixIcon: Icon(Icons.cancel, color: Colors.black, size: 24),
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ),
            Expanded(
              child: Stack(children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: initialPos(),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Center(child: Icon(Icons.person_pin_circle, color: Theme.of(context).accentColor, size: 56)),
              ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.my_location, size: 24),
          onPressed: () {
            loadCurrentLocation();
          },
        ),
      ),
    );
  }
}
