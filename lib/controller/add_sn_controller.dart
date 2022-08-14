import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void snfilter(String jumlahAset) async {
    final results = await firestore
        .collection('assets')
        .where('ab_jumlahAset', arrayContains: jumlahAset)
        .get();

        if (results.docs.length == jumlahAset.length) {
          if (kDebugMode) {
            print(results.docs);
          }
        } else {
          if (kDebugMode) {
            print('No results');
          }
        }
    
  }
}