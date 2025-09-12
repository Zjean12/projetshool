import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final LatLng _center = const LatLng(45.521563, -122.677433);
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Test'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          print('Google Map created'); // Impression de la création de la carte
        },
        onCameraMove: (CameraPosition position) {
          print('Camera moved to: ${position.target}'); // Affiche la position de la caméra
        },
        onCameraIdle: () {
          print('Camera idle'); // Impression lorsque la caméra est en pause
        },
      ),
    );
  }
}

