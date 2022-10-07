import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:inti_firebase/controller/routes_name.dart';

class AddPartCont extends GetxController {
  late TextEditingController namaPartCont;
  late TextEditingController lokasiPartCont;
  late TextEditingController jumlahPartCont;
  late TextEditingController catatanPartCont;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addPart(
    String namaPart,
    String lokasiPart,
    String jumlahPart,
    String catatanPart,
  ) async {
    CollectionReference part = firestore.collection("part");
    try {
      String dateNow = DateTime.now().toIso8601String();
      // int jumlahPart = int.parse(jumlahPartCont.text);
      await part.add({
        "ba_namaPart" : namaPart,
        "bb_lokasiPart" : lokasiPart,
        "bc_jumlahPart" : int.parse(jumlahPart),
        "bd_catatanPart" : catatanPart,
        "be_time" : dateNow
      });
      Get.defaultDialog(
        title: "Done",
        middleText: "Successfuly Added Part",
        onConfirm: () {
          namaPartCont.clear();
          lokasiPartCont.clear();
          jumlahPartCont.clear();
          catatanPartCont.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "Something Wrong!!!",
        middleText: "Something Wrong, you can't add asset to database!!!"
      );
    }
  }
  @override
  void onInit() {
    namaPartCont = TextEditingController();
    lokasiPartCont = TextEditingController();
    jumlahPartCont = TextEditingController();
    catatanPartCont = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    namaPartCont.dispose();
    lokasiPartCont.dispose();
    jumlahPartCont.dispose();
    catatanPartCont.dispose();
    super.onClose();
  }
}