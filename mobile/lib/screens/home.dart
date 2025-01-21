import 'package:flutter/material.dart';
import 'package:mobile/providers/vendor_provider.dart';
import 'package:mobile/widgets/vendor_map.dart';
import 'package:provider/provider.dart';
import 'package:mobile/widgets/vendor_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final vendors = Provider.of<VendorProvider>(context).vendors;

    return Scaffold(
      appBar: AppBar(title: Text('Vendors'), actions: [
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        )
      ]),
      body: isSwitched
          ? VendorList(
              vendors: vendors,
            )
          : VendorMap(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-vendor');
        },
        child: Icon(Icons.add),
      ), // Vendor details goes here
    );
  }
}
