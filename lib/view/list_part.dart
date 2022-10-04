import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/list_part_controller.dart';
import 'package:inti_firebase/view/part.dart';

class ListPartScreen extends GetView<ListPartScreen> {
  ListPartScreen({Key? key}) : super(key: key);
  final readCont = Get.put(ListPartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIST PART"),
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPartView(),
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: readCont.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["ba_namaPart"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["bc_jumlahPart"]}"),
                textColor: Colors.white,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
