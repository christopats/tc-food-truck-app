import 'package:flutter/material.dart';
import 'package:mobile/models/vendor.dart';

class VendorDetails extends StatelessWidget {
  const VendorDetails({super.key, required this.vendor});

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final heading = theme.textTheme.headlineLarge;
    final body = theme.textTheme.bodyMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text(vendor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(vendor.name, style: heading),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(vendor.description, style: body),
            ),
          ],
        ),
      ),
    );
  }
}
