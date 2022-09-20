import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, FirebaseFirestore;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:dropdown_textfield/dropdown_textfield.dart';

class AddAssetCont extends GetxController {
  late TextEditingController namaPerangkatCont;
  late TextEditingController serialNumberCont;
  late TextEditingController nomerSertifikatCont;
  late TextEditingController posisiPerangkatCont;
  late TextEditingController typePerangkatCont;
  late TextEditingController jenisPerangkatCont;
  late TextEditingController catatanAsetCont;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // AddAssetCont(TextEditingController asetNameCont);

  

  // final _formKey = GlobalKey<FormState>();

  void addAsset(
    String namaPerangkat,
    String serialNumber,
    String nomerSertifikat,
    String posisiPerangkat,
    String typePerangkat,
    String jenisPerangkat,
    String catatanAset,
  ) async {
    CollectionReference assets = firestore.collection("assets");
    try {
      String dateNow = DateTime.now().toIso8601String();
      await assets.add({
        "aa_namaPerangkat": namaPerangkat,
        "ab_serialNumber": serialNumber,
        "ac_satuanAset": nomerSertifikat,
        "ad_posisiPerangkat": posisiPerangkat,
        "ae_typePerangkat": typePerangkat,
        "af_jenisPerangkat": jenisPerangkat,
        "ag_catatanAset": catatanAset,
        "ah_time": dateNow
      });
      Get.defaultDialog(
          title: "Done",
          middleText: "Successfuly",
          onConfirm: () {
            namaPerangkatCont.clear();
            serialNumberCont.clear();
            nomerSertifikatCont.clear();
            posisiPerangkatCont.clear();
            typePerangkatCont.clear();
            jenisPerangkatCont.clear();
            catatanAsetCont.clear();
            Get.back();
            Get.back();
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
    
    serialNumberCont = TextEditingController();
    nomerSertifikatCont = TextEditingController();
    posisiPerangkatCont = TextEditingController();
    typePerangkatCont = TextEditingController();
    jenisPerangkatCont = TextEditingController();
    catatanAsetCont = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaPerangkatCont.dispose();
    serialNumberCont.dispose();
    nomerSertifikatCont.dispose();
    posisiPerangkatCont.dispose();
    typePerangkatCont.dispose();
    jenisPerangkatCont.dispose();
    catatanAsetCont.dispose();
    super.onClose();
  }
}
