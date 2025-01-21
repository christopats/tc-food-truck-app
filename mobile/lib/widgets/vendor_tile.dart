import 'package:flutter/material.dart';

class VendorTile extends StatelessWidget {
  final String name;
  final String description;

  VendorTile({
    required this.name,
    required this.description, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
    );
  }
}
