import 'package:flutter/material.dart';
import '../models/vendor.dart';

class VendorProvider with ChangeNotifier {
  List<Vendor> _vendors = [];

  List<Vendor> get vendors {
    return [..._vendors];
  }

  void addVendor(Vendor vendor) {
    _vendors.add(vendor);
    notifyListeners();
  }

  // Methods to update and delete tasks
}
