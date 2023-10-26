import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryController extends GetxController{
  Completer<GoogleMapController> con = Completer();
    CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(23, 72),
    zoom: 14.47,
  );
  List<Marker> marker = [];
  String add = "";
  String add1 = "";

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
  Future<void> onTap() async {
    getUserLocation().then((value) async {
      marker.add(Marker(
        markerId: const MarkerId("4"),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: const InfoWindow(title: "My current location"),
      ));
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14);
      print("----------------${value.latitude}");
      print("----------------${value.longitude}");
      final GoogleMapController controller = await con.future;
      controller
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      update();
    });
    List<Placemark> placeMark =
        await placemarkFromCoordinates(21.21436, 72.8863378);

      add = placeMark.reversed.last.thoroughfare.toString() +
          ", " +
          placeMark.reversed.last.subLocality.toString();
       add1  = placeMark.reversed.last.locality.toString() +", "+
          placeMark.reversed.last.administrativeArea.toString()+", "+ placeMark.reversed.last.country.toString()+
          placeMark.reversed.last.postalCode.toString();
update();
  }
}