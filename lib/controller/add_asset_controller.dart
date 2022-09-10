import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, FirebaseFirestore;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:dropdown_textfield/dropdown_textfield.dart';

class AddAssetCont extends GetxController {
  late TextEditingController namaPerangkatCont;
  late TextEditingController posisiPerangkatCont;
  late TextEditingController merkPerangkatCont;
  late TextEditingController typePerangkatCont;
  late TextEditingController serialNumberCont;
  late TextEditingController nomerSertifikatCont;
  late TextEditingController jenisPerangkatCont;
  late TextEditingController catatanAsetCont;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  get selectedValue => null;

  void addAsset(
    String namaPerangkat,
    String posisiPerangkat,
    String merkPerangkat,
    String typePerangkat,
    String serialNumber,
    String nomerSertifikat,
    String jenisPerangkat,
    String catatanAset,
  ) async {
    CollectionReference assets = firestore.collection("assets");
    try {
      String dateNow = DateTime.now().toIso8601String();
      await assets.add({
        "aa_namaPerangkat": namaPerangkat,
        "ab_posisiPerangkat": posisiPerangkat,
        "ac_merkPerangkat": merkPerangkat,
        "ad_typePerangkat": typePerangkat,
        "ae_serialNumber": serialNumber,
        "af_nomerSertifikat": nomerSertifikat,
        "ag_catatanAset": catatanAset,
        "ah_jenisPerangkat":jenisPerangkat,
        "ai_time": dateNow
      });
      Get.defaultDialog(
          title: "Done",
          middleText: "Successfuly",
          onConfirm: () {
            namaPerangkatCont.clear();
            posisiPerangkatCont.clear();
            merkPerangkatCont.clear();
            typePerangkatCont.clear();
            serialNumberCont.clear();
            nomerSertifikatCont.clear();
            jenisPerangkatCont.clear();
            catatanAsetCont.clear();
            Get.back();
            Get.back();
            // Get.back();
          },
          textConfirm: "OK");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
          title: "Something Wrong!!!",
          middleText: "Something Wrong, you can't add asset to database!!!");
    }
  }

  @override
  void onInit() {
    namaPerangkatCont = TextEditingController();
    posisiPerangkatCont = TextEditingController();
    merkPerangkatCont = TextEditingController();
    typePerangkatCont = TextEditingController();
    serialNumberCont = TextEditingController();
    nomerSertifikatCont = TextEditingController();
    jenisPerangkatCont = TextEditingController();
    catatanAsetCont = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaPerangkatCont.dispose();
    posisiPerangkatCont.dispose();
    merkPerangkatCont.dispose();
    typePerangkatCont.dispose();
    serialNumberCont.dispose();
    nomerSertifikatCont.dispose();
    jenisPerangkatCont.dispose();
    catatanAsetCont.dispose();
    super.onClose();
  }
  // String? selectedNewValue;

  // var satuanAset = <String>['Unit', "PCS"];

  // void onSelected(String value) {
  //   selectedNewValue = value;

  //   update();

  //   if (kDebugMode) {
  //     print(selectedValue);
  //     changeSatuan(selectedValue);
  //   }
  // }

  // changeSatuan(String? selectedSatuan) {
  //   switch (selectedSatuan) {
  //     case 'Unit':
  //       Get.updateLocale(
  //         const Locale('Unit'),
  //       );
  //       break;
  //     case 'PCS':
  //       Get.updateLocale(
  //         const Locale('PCS'),
  //       );
  //       break;
  //     default:
  //       Get.updateLocale(
  //         const Locale('Unit'),
  //       );
  //       break;
  //   }
  // }
}
