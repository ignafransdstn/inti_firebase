import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/edit_asset_controller.dart';
// import '../controller/add_sn_controller.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:inti_firebase/utils/kategori_dd_widget.dart';

class EditAssetView extends GetView<EditAssetCont> {
  final addController = Get.put(EditAssetCont());
  // final String dropdownValue = 'Warehouse';

  EditAssetView({Key? key}) : super(key: key);

  final listLokasi = [
    "Warehouse",
    "33.000",
    "40.500",
    "Unit LV",
    "Unit BD",
    "Unit EXCA",
    "Unit TR",
    "Unit SDT",
    "Unit GD",
    "Unit WT",
    "Other"
  ];

  final listKategori = ["Consumable", "Non-consumable"];

  final listJenis = [
    "Access Point",
    "Radio",
    "PC",
    "Monitor",
    "Fatique Equipment",
    "FMS Equipment",
    "Other"
  ];

  final listSatuan = ["PCS", "Meter", "Unit"];

  final formKey = GlobalKey<FormState>();

  void submitEditButton() {
    if (formKey.currentState!.validate()) {
      controller.editAsset(
          controller.asetNameCont.text,
          controller.jumlahAsetCont.text,
          controller.jenisAsetCont.text,
          controller.satuanAsetCont.text,
          controller.lokasiAsetCont.text,
          controller.kategoriAsetCont.text,
          controller.catatanAsetCont.text,
          Get.arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDIT ASSET'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.asetNameCont.text = data["aa_asetName"];
            controller.jumlahAsetCont.text = data["ab_jumlahAset"];
            controller.jenisAsetCont.text = data["ac_jenisAset"];
            controller.satuanAsetCont.text = data["ad_satuanAset"];
            controller.lokasiAsetCont.text = data["ae_lokasiAset"];
            controller.kategoriAsetCont.text = data["af_kategoriAset"];
            controller.catatanAsetCont.text = data["ag_catatanAset"];
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: controller.asetNameCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field cant be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Nama Aset",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: controller.jumlahAsetCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field cant be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Jumlah Aset",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // LocationDropDown(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.kategoriAsetCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field cant be empty';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Pilih Kategori Aset",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      padding: const EdgeInsets.all(0.1),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      onSelected: (String value) {
                        controller.kategoriAsetCont.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return listKategori
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              value: value, child: Text(value));
                        }).toList();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.satuanAsetCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field cant be empty';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Pilih Satuan Aset",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      padding: const EdgeInsets.all(0.1),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      onSelected: (String value) {
                        controller.satuanAsetCont.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return listSatuan
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              value: value, child: Text(value));
                        }).toList();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.jenisAsetCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field cant be empty';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Pilih Jenis Aset",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      padding: const EdgeInsets.all(0.1),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      onSelected: (String value) {
                        controller.jenisAsetCont.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return listJenis
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              value: value, child: Text(value));
                        }).toList();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.lokasiAsetCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field cant be empty';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Pilih Lokasi Aset",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      padding: const EdgeInsets.all(0.1),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      onSelected: (String value) {
                        controller.lokasiAsetCont.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return listLokasi
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              value: value, child: Text(value));
                        }).toList();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: controller.catatanAsetCont,
                        decoration: const InputDecoration(
                          labelText: "Catatan",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
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
                            primary: const Color.fromARGB(255, 47, 48, 128)),
                        onPressed: () => submitEditButton(),
                        child: const Text("UPDATE ASET"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
