// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/add_part_controller.dart';

class AddPartView extends GetView<AddPartCont> {
  final addController = Get.put(AddPartCont());

  AddPartView({Key? key}) : super(key: key);

  final listLokasi = [
    "Barito Utara",
    "Kutai Barat",
    "IT",
    "KM 39",
    "MNT 39",
    "KM 33",
    "MNT 33",
    "SB 1",
    "SB 2",
    "SHELTER 33",
    "ULIN",
    "PIT BK 21",
    "PIT BK 22",
    "PIT BK 14",
    "OTHER"
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submitButton() {
    if (_formKey.currentState!.validate()) {
      controller.addPart(
          controller.namaPartCont.text,
          controller.lokasiPartCont.text,
          controller.jumlahPartCont.text,
          controller.catatanPartCont.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NEW PART'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // -----------> Nama Part
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: controller.namaPartCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Nama Part",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              // -----------> Posisi Part
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(color: Colors.white),
                  controller: controller.lokasiPartCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter some text";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        onSelected: (String value) {
                          controller.lokasiPartCont.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return listLokasi
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                                value: value, child: Text(value));
                          }).toList();
                        },
                      ),
                    ),
                    labelText: "Posisi Part",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----------> Jumlah Part
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: controller.jumlahPartCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Jumlah Part",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----------> Catatan Part
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: controller.catatanPartCont,
                  decoration: InputDecoration(
                    labelText: "Catatan",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 47, 48, 128),
                  ),
                  onPressed: () => submitButton(),
                  child: const Text("ADD PART"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
