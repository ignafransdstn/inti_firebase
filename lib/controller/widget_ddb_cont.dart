import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  String? selectedValue;

  var satuanAset = <String>['Unit', "PCS"];

  void onSelected(String value) {
    selectedValue = value;

    update();

    if (kDebugMode) {
      print(selectedValue);
      changeSatuan(selectedValue);
    }
  }

  changeSatuan(String? selectedSatuan) {
    switch (selectedSatuan) {
      case 'Unit':
        Get.updateLocale(
          const Locale('Unit'),
        );
        break;
      case 'PCS':
        Get.updateLocale(
          const Locale('PCS'),
        );
        break;
      default:
        Get.updateLocale(
          const Locale('Unit'),
        );
        break;
    }
  }
}
