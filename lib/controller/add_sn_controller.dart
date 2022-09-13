// // import 'dart:collection';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class QueryController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // var stringToInt = int.parse();

//   Future<QuerySnapshot<Object?>> getData() async {
//     CollectionReference assets = firestore.collection("assets");
//     return assets.get();
//   }

//   // Stream<QuerySnapshot<Object?>> streamData() {
//   //   CollectionReference assets = firestore.collection("assets");
//   //   return assets.where("ab_jumlahAset");
//   // } 

//   void snfilter(String jumlahAset) async {
//     final results = await firestore
//         .collection('assets')
//         .doc(jumlahAset)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//           if (documentSnapshot.data() != jumlahAset) {
            
//           }
//         });

//         // if (results.docs.length == jumlahAset.length) {
//         //   if (kDebugMode) {
//         //     print(results.docs);
//         //   }
//         // } else {
//         //   if (kDebugMode) {
//         //     print('No results');
//         //   }
//         // }
//   }
// }