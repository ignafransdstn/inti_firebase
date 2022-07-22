import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, FirebaseFirestore;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:dropdown_textfield/dropdown_textfield.dart';

class AddAssetCont extends GetxController {
  late TextEditingController asetNameCont;
  late TextEditingController jumlahAsetCont;
  late TextEditingController jenisAsetCont;
  late TextEditingController satuanAsetCont;
  late TextEditingController lokasiAsetCont;
  // late SingleValueDropDownController lokasiAsetCont;
  late TextEditingController kategoriAsetCont;
  late TextEditingController catatanAsetCont;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // AddAssetCont(TextEditingController asetNameCont);

  

  // final _formKey = GlobalKey<FormState>();

  void addAsset(
    String asetName,
    String jumlahAset,
    String jenisAset,
    String satuanAset,
    String lokasiAset,
    String kategoriAset,
    String catatanAset,
  ) async {
    CollectionReference assets = firestore.collection("assets");
    try {
      String dateNow = DateTime.now().toIso8601String();
      await assets.add({
        "aa_asetName": asetName,
        "ab_jumlahAset": jumlahAset,
        "ac_jenisAset": jenisAset,
        "ad_satuanAset": satuanAset,
        "ae_lokasiAset": lokasiAset,
        "af_kategoriAset": kategoriAset,
        "ag_catatanAset": catatanAset,
        "ah_time": dateNow
      });
      Get.defaultDialog(
          title: "Done",
          middleText: "Successfuly",
          onConfirm: () {
            asetNameCont.clear();
            jumlahAsetCont.clear();
            jenisAsetCont.clear();
            satuanAsetCont.clear();
            lokasiAsetCont.clear();
            kategoriAsetCont.clear();
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
    asetNameCont = TextEditingController();
    jumlahAsetCont = TextEditingController();
    jenisAsetCont = TextEditingController();
    satuanAsetCont = TextEditingController();
    lokasiAsetCont = TextEditingController();
    // lokasiAsetCont = SingleValueDropDownController();
    kategoriAsetCont = TextEditingController();
    catatanAsetCont = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    asetNameCont.dispose();
    jumlahAsetCont.dispose();
    jenisAsetCont.dispose();
    satuanAsetCont.dispose();
    lokasiAsetCont.dispose();
    kategoriAsetCont.dispose();
    catatanAsetCont.dispose();
    super.onClose();
  }
}
