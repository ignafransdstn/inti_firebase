import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPartController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference part = firestore.collection("part");
    return part.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference part = firestore.collection("part");
    return part.orderBy("be_time", descending: true).snapshots();
  }

  void deleteParts(String docID) {
    DocumentReference docRef = firestore.collection("part").doc(docID);
    try {
      Get.defaultDialog(
        title: "DELETE PARTS",
        middleText: "ARE YOU SURE DELETE THIS DATA?",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: "YES",
        textCancel: "NO"
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "SOMETHING WRONG",
        middleText: "PLEASE CHECK YOUR NETWORK CONNECTION OR TRY REDELETE THE PARTS ITEM"
      );
    }
  }
}