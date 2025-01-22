import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VendorMap extends StatefulWidget {
  const VendorMap({super.key});

  @override
  State<VendorMap> createState() => _VendorMapState();
}

class _VendorMapState extends State<VendorMap> {
  List<Marker> markers = [];
  GoogleMapController? googleMapController;
  Marker? selectedMarker;
  late BitmapDescriptor defaultPin;
  late BitmapDescriptor selectedPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          markers: markers.toSet(),
          initialCameraPosition: const CameraPosition(
            target: LatLng(41.00024866867318, 29.0257125104099),
            zoom: 8.4746,
          ),
          onMapCreated: (controller) {
            googleMapController = controller;
          },
        ),
      ),
    );
  }

  Future<void> getInitialMarkers() async {
    defaultPin = await icon('assets/images/map_markers/map-marker-red.png');
    selectedPin = await icon('assets/images/map_markers/map-marker-green.png');

    markers = [
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(40.98497470084764, 29.069472563574063),
        icon: defaultPin,
        infoWindow: const InfoWindow(title: 'title 1', snippet: 'snippet 1'),
        onTap: () => onTap(const MarkerId('1')),
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(40.83428951050001, 29.481392650987797),
        icon: defaultPin,
        infoWindow: const InfoWindow(title: 'title 2', snippet: 'snippet 2'),
        onTap: () => onTap(const MarkerId('2')),
      ),
    ];
    refresh();
  }

  Future<BitmapDescriptor> icon(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: 66,
    );
    final FrameInfo frameInfo = await codec.getNextFrame();
    final byteData =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getInitialMarkers();
    });
  }

  void onTap(MarkerId markerId) {
    googleMapController?.showMarkerInfoWindow(markerId);

    setSelectedMarker(markerId);
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  void setSelectedMarker(MarkerId markerId) {
    // Reset previously selected marker if exists
    if (selectedMarker != null) {
      setSelectedToNormal();
    }

    final markerIndex = markers.indexWhere((m) => m.markerId == markerId);
    if (markerIndex != -1) {
      final marker = markers[markerIndex];
      markers[markerIndex] = marker.copyWith(
        iconParam: selectedPin,
      );
      selectedMarker = markers[markerIndex];
    }
  }

  void setSelectedToNormal() {
    if (selectedMarker == null) return;

    final markerIndex =
        markers.indexWhere((m) => m.markerId == selectedMarker!.markerId);
    if (markerIndex != -1) {
      final marker = markers[markerIndex];
      markers[markerIndex] = marker.copyWith(
        iconParam: defaultPin,
      );
      selectedMarker = null;
    }
  }
}
