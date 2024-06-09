import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class TrailHandling {
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  List<Marker> markers;
  String routeId;

  TrailHandling({required this.markers, required this.routeId}); // Constructor to initialize the markers list and routeId

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates
    );
    polylines[id] = polyline;
  }

  void createRoute() async {
    polylineCoordinates.clear(); // Clear the polyline coordinates

    // Parse the routeId to get the individual marker IDs
    for (var markerId in routeId.split('')) {
      // Find the marker with the corresponding ID
      Marker? marker = markers.firstWhere((marker) =>
      marker.markerId!.value == markerId);

      if (marker != null) {
        polylineCoordinates.add(marker
            .position); // Add the marker position to the polyline coordinates
      }
    }

    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      PointLatLng start = PointLatLng(
          polylineCoordinates[i].latitude, polylineCoordinates[i].longitude);
      PointLatLng end = PointLatLng(polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);

      await polylinePoints
          .getRouteBetweenCoordinates(
        'afpkafkpd',
        start, // Starting PointLatLng
        end, // End PointLatLng
        travelMode: TravelMode.driving,
      ).then((value) {
        print('Response from API: $value');
        value.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      });
    }
    print('Polyline coordinates: $polylineCoordinates');
    print(polylineCoordinates);
    addPolyLine() {
      print(
          'Adding polyline'); // Print a message to indicate that the polyline is being added
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id,
          color: Colors.red,
          points: polylineCoordinates
      );
      polylines[id] = polyline;
      print('Polylines: $polylines'); // Print the polylines map
    }
  }
}



// AIzaSyBBS_NyMymyChuMoY4WQ6OZi0xJZH8eIY0