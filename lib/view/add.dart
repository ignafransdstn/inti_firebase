import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/add_asset_controller.dart';
// import 'package:inti_firebase/controller/widget_ddb_cont.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:inti_firebase/utils/kategori_dd_widget.dart';

class AddAssetView extends GetView<AddAssetCont> {
  final addController = Get.put(AddAssetCont());
  // final String dropdownValue = 'Warehouse';

  AddAssetView({Key? key}) : super(key: key);

  final listJenis = ["Handheld", "Mobile Unit", "Base Station", "Other"];

  final typePerangkat = [
    "gp338",
    "xir p8668i",
    "p8600i",
    "gm338",
    "xir m3688",
    "xir m3688i"
  ];

  final posisiPerangkat = [
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
    "PIT BK21",
    "PIT BK22",
    "PIT BK14",
    "Other"
  ];

  // final listSatuan = ["PCS", "Meter", "Unit"];
  // bool validate = false;

  final _formKey = GlobalKey<FormState>();

  void submitButton() {
    if (_formKey.currentState!.validate()) {
      controller.addAsset(
          controller.namaPerangkatCont.text,
          controller.posisiPerangkatCont.text,
          controller.merkPerangkatCont.text,
          controller.typePerangkatCont.text,
          controller.serialNumberCont.text,
          controller.nomerSertifikatCont.text,
          controller.jenisPerangkatCont.text,
          controller.catatanAsetCont.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NEW RADIO'),
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
              // Form or row input for Jenis Radio <---------- Info
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              // Form or row input for Posisi Radio <---------- Info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.posisiPerangkatCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.green),
                        onSelected: (String value) {
                          controller.posisiPerangkatCont.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return posisiPerangkat
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Form or row input for Sertifikat Radio <---------- Info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.nomerSertifikatCont,
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Form or row input for Tipe Radio <---------- Info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.typePerangkatCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.green),
                        onSelected: (String value) {
                          controller.typePerangkatCont.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return typePerangkat
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Form or row input for Merek Radio <---------- Info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.merkPerangkatCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Merk Perangkat",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              // PopupMenuButton<String>(
              //   padding: const EdgeInsets.all(0.1),
              //   icon: const Icon(
              //     Icons.arrow_drop_down,
              //     color: Colors.white,
              //   ),
              //   onSelected: (String value) {
              //     controller.merkPerangkatCont.text = value;
              //   },
              //   itemBuilder: (BuildContext context) {
              //     return listJenis.map<PopupMenuItem<String>>((String value) {
              //       return PopupMenuItem(value: value, child: Text(value));
              //     }).toList();
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              // Form or row input for SN Radio <---------- Info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.serialNumberCont,
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              // PopupMenuButton<String>(
              //   padding: const EdgeInsets.all(0.1),
              //   icon: const Icon(
              //     Icons.arrow_drop_down,
              //     color: Colors.white,
              //   ),
              //   onSelected: (String value) {
              //     controller.serialNumberCont.text = value;
              //   },
              //   itemBuilder: (BuildContext context) {
              //     return listLokasi.map<PopupMenuItem<String>>((String value) {
              //       return PopupMenuItem(value: value, child: Text(value));
              //     }).toList();
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.jenisPerangkatCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefix: DropdownButtonHideUnderline(
                      child: PopupMenuButton<String>(
                        // padding: const EdgeInsets.all(0.1),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.green),
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
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
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
              // Form or row input for Catatan Radio <---------- Info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.catatanAsetCont,
                  // Optional <---------- Info
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
                      borderRadius: BorderRadius.circular(30),
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
                    primary: const Color.fromARGB(255, 47, 48, 128),
                  ),
                  onPressed: () => submitButton(),
                  child: const Text("ADD ASSET"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
