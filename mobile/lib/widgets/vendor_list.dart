import 'package:flutter/material.dart';
import 'package:mobile/models/vendor.dart';
import 'package:mobile/screens/vendor_details.dart';

class VendorList extends StatelessWidget {
  const VendorList({
    super.key,
    required this.vendors,
  });

  final List<Vendor> vendors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vendors.length,
      itemBuilder: (ctx, index) {
        return ListTile(
            title: Text(vendors[index].name),
            subtitle: Text(vendors[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorDetails(vendor: vendors[index]),
                ),
              );
            });
      },
    );
  }
}
