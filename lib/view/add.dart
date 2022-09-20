import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/add_asset_controller.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:inti_firebase/utils/kategori_dd_widget.dart';

// ignore: must_be_immutable
class AddAssetView extends GetView<AddAssetCont> {
  final addController = Get.put(AddAssetCont());
  // final String dropdownValue = 'Warehouse';

  AddAssetView({Key? key}) : super(key: key);

  final listSeriPerangkat = [
    "gp338",
    "xir p8668i",
    "p8600i",
    "gm338",
    "xir m3688",
    "xir m3688i",
    "Other"
  ];

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

final listJenis = ["Handheld", "Mobile Unit", "Base Station", "Other"];

  // final listJenis = ["Handheld", "Mobile Unit", "Base Station", "Other"];
  // final listSatuan = ["PCS", "Meter", "Unit"];
  // ignore: prefer_typing_uninitialized_variables
  // bool validate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submitButton() {
    if (_formKey.currentState!.validate()) {
      controller.addAsset(
          controller.namaPerangkatCont.text,
          controller.serialNumberCont.text,
          controller.nomerSertifikatCont.text,
          controller.posisiPerangkatCont.text,
          controller.typePerangkatCont.text,
          controller.jenisPerangkatCont.text,
          controller.catatanAsetCont.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NEW ASSET'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.namaPerangkatCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Nama Perangkat",
                    labelStyle: const TextStyle(color: Colors.white),
                    // errorText: validate? "Please fill Nama Asset" : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.serialNumberCont,
                  // validator: (value) => value!.isEmpty ? 'please enter some text' : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Serial Number",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.nomerSertifikatCont,
                  // validator: (value) => value!.isEmpty ? 'please enter some text' : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Nomer Sertifikat",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.posisiPerangkatCont,
                  // validator: (value) => value!.isEmpty ? 'please enter some text' : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        padding: const EdgeInsets.all(0.1),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        onSelected: (String value) {
                          controller.posisiPerangkatCont.text = value;
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
                    labelText: "Posisi Perangkat",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.typePerangkatCont,
                  // validator: (value) => value!.isEmpty ? 'please enter some text' : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        padding: const EdgeInsets.all(0.1),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        onSelected: (String value) {
                          controller.typePerangkatCont.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return listSeriPerangkat
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                                value: value, child: Text(value));
                          }).toList();
                        },
                      ),
                    ),
                    labelText: "Tipe Perangkat",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.jenisPerangkatCont,
                  // validator: (value) => value!.isEmpty ? 'please enter some text' : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        padding: const EdgeInsets.all(0.1),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        onSelected: (String value) {
                          controller.jenisPerangkatCont.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return listJenis
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                                value: value, child: Text(value));
                          }).toList();
                        },
                      ),
                    ),
                    labelText: "Jenis Perangkat",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ----->> Test baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.catatanAsetCont,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    labelText: "Catatan",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 47, 48, 128),
                  ),
                  onPressed: () => submitButton(),
                  child: const Text("ADD RADIO ASSET"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
