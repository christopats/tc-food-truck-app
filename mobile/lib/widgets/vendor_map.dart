import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class VendorMap extends StatefulWidget {
  const VendorMap({super.key});

  @override
  State<VendorMap> createState() => _VendorMapState();
}

class _VendorMapState extends State<VendorMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(50.15, -5.37);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 9.5,
      ),
    );
  }
}
