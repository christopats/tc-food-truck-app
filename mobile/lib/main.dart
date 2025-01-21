import 'package:flutter/material.dart';
import 'package:mobile/providers/vendor_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/add_vendor.dart';

void main() {
  runApp(FoodTruckApp());
}

class FoodTruckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VendorProvider(),
      child: MaterialApp(
        title: 'Food Truck App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomeScreen(),
          '/add-vendor': (ctx) => AddVendor(),
        },
      ),
    );
  }
}
