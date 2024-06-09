import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:location/location.dart';
import '../logic/map_objects.dart';
import '../logic/page_routing.dart';
import '../logic/trail_handling.dart';
import '../ui/menu.dart';
import '../logic/json_handling.dart';

// import '../app/location_handling.dart';



class TrailMapPage extends StatefulWidget {
  const TrailMapPage({super.key, required String title, required this.id});

  final String id;
  @override
  State<TrailMapPage> createState() => _State();
}

class _State extends State<TrailMapPage> {
  late GoogleMapController mapController;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(50.453799, 19.551831),
    zoom: 11.0,
  );

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    late TrailHandling _trailHandling;
    final MapObjects _mapObjects = Provider.of<MapObjects>(context, listen: false);
    final PageRouting _pageRouting = Provider.of<PageRouting>(context, listen: false);
    _trailHandling = TrailHandling(markers: _mapObjects.markers, routeId: '54321');

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa', style: textTheme.bodyMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: FutureBuilder(
        future: _mapObjects.loadMarkersFromJson(jsonData: JsonHandler().returnJson(), context: context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _trailHandling.createRoute(); // Create the trail based on the ID
            return GoogleMap(
              markers: Set<Marker>.of(_mapObjects.markers),
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialCameraPosition,
              mapType: MapType.hybrid,
              compassEnabled: true,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              polylines: _trailHandling.polylines.values.toSet(), // Add the polylines to the GoogleMap
              onLongPress: (latLng) {
                Marker? tappedMarker;
                _mapObjects.markers.forEach((marker) {
                  if ((latLng.latitude - marker.position.latitude).abs() < 0.0005 &&
                      (latLng.longitude - marker.position.longitude).abs() < 0.0005) {
                    tappedMarker = marker;
                  }
                });
                if (tappedMarker!= null) {
                  try {
                    final id = int.parse(tappedMarker!.markerId!.value);
                    MaterialPageRoute route = _pageRouting.RouteToPage(id);
                    Navigator.push(context, route);
                  } catch (e) {
                    print("Error: markerId.value is not a number");
                  }
                }
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}