// import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditAssetCont extends GetxController {
  late TextEditingController asetNameCont;
  late TextEditingController jumlahAsetCont;
  late TextEditingController jenisAsetCont;
  late TextEditingController satuanAsetCont;
  late TextEditingController lokasiAsetCont;
  late TextEditingController kategoriAsetCont;
  late TextEditingController catatanAsetCont;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("assets").doc(docID);
    return docRef.get();
  }

  void editAsset(
    String asetName,
    String jumlahAset,
    String jenisAset,
    String satuanAset,
    String lokasiAset,
    String kategoriAset,
    String catatanAset,
    String docID
  ) async {
    DocumentReference assets = firestore.collection("assets").doc(docID);
    try {
      String dateNow = DateTime.now().toIso8601String();
      await assets.update({
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
          middleText: "Something Wrong, you can't edit asset to database!!!");
    }
  }
  @override
  void onInit() {
    asetNameCont = TextEditingController();
    jumlahAsetCont = TextEditingController();
    jenisAsetCont = TextEditingController();
    satuanAsetCont = TextEditingController();
    lokasiAsetCont = TextEditingController();
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
