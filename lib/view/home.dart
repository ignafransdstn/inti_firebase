import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inti_firebase/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/routes_name.dart';
import 'package:inti_firebase/controller/home_controller.dart';


class HomeScreen extends GetView<HomeScreen> {
 HomeScreen({Key? key}) : super(key: key);
  final authCont = Get.find<AuthController>();
  final readCont = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        backgroundColor:const Color.fromARGB(255, 47, 48, 128),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authCont.logout(),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: readCont.streamData(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.active) {
            var listAllDocs = snapshots.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                // onTap: () => Get.toNamed(Routes.edit_screen, arguments: listAllDocs[index].id),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["aa_namaPerangkat"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["ab_serialNumber"]}"),
                textColor: Colors.white,
                trailing: IconButton(
                  onPressed: () => readCont.deleteAssets(listAllDocs[index].id),
                  icon: const Icon(Icons.delete_forever_rounded),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: 7,
      //   itemBuilder: (context, index) => const ListTile(
      //     title: Text("List Aset"),
      //     textColor: Colors.white,
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.menu_screen),
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
        child: const Icon(Icons.add_circle_outlined),
      ),
    );
  }
}
