import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/models/vendor.dart';
import 'package:mobile/providers/vendor_provider.dart';
import 'package:provider/provider.dart';

class AddVendor extends StatelessWidget {
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _vendorDescriptionController =
      TextEditingController();
  final TextEditingController _vendorEmailController = TextEditingController();
  final TextEditingController _vendorLatitudeController =
      TextEditingController();
  final TextEditingController _vendorLongitudeController =
      TextEditingController();

  void _addVendor(BuildContext context) {
    final String name = _vendorNameController.text;
    final String description = _vendorDescriptionController.text;
    final String email = _vendorEmailController.text;
    final double latitude = double.parse(_vendorLatitudeController.text);
    final double longitude = double.parse(_vendorLongitudeController.text);

    if (name.isNotEmpty) {
      Provider.of<VendorProvider>(context, listen: false).addVendor(
        Vendor(
          id: DateTime.now().toString(),
          name: name,
          email: email,
          description: description,
          location: LatLng(latitude, longitude),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Vendor'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _vendorNameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: _vendorDescriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: _vendorEmailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _vendorLatitudeController,
                  decoration: InputDecoration(labelText: 'Lat'),
                ),
                TextFormField(
                  controller: _vendorLongitudeController,
                  decoration: InputDecoration(labelText: 'Long'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _addVendor(context),
                  child: Text("Add Vendor"),
                ),
              ],
            )));
  }
}
