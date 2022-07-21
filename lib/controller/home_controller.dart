import 'package:flutter/foundation.dart';
import "package:get/get.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// READ DATA WITH STREAM BUILDER
class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference assets = firestore.collection("assets");
    return assets.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference assets = firestore.collection("assets");
    return assets.orderBy("ah_time", descending: true).snapshots();
  }

  void deleteAssets(String docID) {
    DocumentReference docRef = firestore.collection("assets").doc(docID);
    try {
      Get.defaultDialog(
        title: "DELETE ASSETS",
        middleText: "ARE YOU SURE DELETE THIS DATA?",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: "YES",
        textCancel: "NO",
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "SOMETHING WRONG",
        middleText: "PLEASE CHECK YOUR NETWORK CONNECTIONS OR TRY REDELETE THE ASSETS ITEM"
      );
    }
  }

  delete() {}
}
