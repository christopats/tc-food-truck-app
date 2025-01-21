import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vendor {
  final String id;
  final String name;
  final String email;
  final String description;
  final LatLng location;

  Vendor({
    required this.id,
    required this.name,
    required this.email,
    required this.description,
    required this.location,
  });
}
