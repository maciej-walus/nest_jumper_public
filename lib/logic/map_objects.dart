import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nest_jumper/logic/page_routing.dart';

/// Klasa odpowiedzalna za tworzenie markerów

class MapObjects with ChangeNotifier {
  List<Marker> markers = <Marker>[];

  void addMarkerToList(id, name, latitude, longitude, type, context) async {
    BitmapDescriptor icon;
    PageRouting();
    switch (type) {
      case 'Castle':
        icon = await _loadIcon('assets/icons/castle.png');
        break;
      case 'Palace':
        icon = await _loadIcon('assets/icons/palace.png');
        break;
      case 'Outpost':
        icon = await _loadIcon('assets/icons/outpost.png');
        break;
      default:
        icon = BitmapDescriptor.defaultMarker;
    }

    final Marker marker = Marker(
        markerId: MarkerId(id.toString()),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: name),
        icon: icon
      );
      markers.add(marker);
    }

  Future<BitmapDescriptor> _loadIcon(String assetPath) async {
    return BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.5, size: Size(40, 40)), assetPath);
  }

  Future<void> loadMarkersFromJson({required Future<List<dynamic>> jsonData, context}) async {
    for (var attraction in await jsonData) {
      final id = attraction['id'];
      final name = attraction['name'];
      final latitude = attraction['latitude'];
      final longitude = attraction['longitude'];
      final type = attraction['type'];

      addMarkerToList(id, name, latitude, longitude, type, context);
    }
  }
}


