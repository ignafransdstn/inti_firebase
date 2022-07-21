import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/add_asset_controller.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:inti_firebase/utils/kategori_dd_widget.dart';

class AddAssetView extends GetView<AddAssetCont> {
  final addController = Get.put(AddAssetCont());
  // final String dropdownValue = 'Warehouse';

  AddAssetView({Key? key}) : super(key: key);

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
  // bool validate = false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NEW ASSET'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          key: formKey,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: controller.asetNameCont,
                decoration: const InputDecoration(
                  labelText: "Nama Aset",
                  labelStyle: TextStyle(color: Colors.white),
                  // errorText: validate? "Please fill Nama Asset" : null,
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
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: controller.jumlahAsetCont,
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
              child: TextField(
                controller: controller.kategoriAsetCont,
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
                return listKategori.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.satuanAsetCont,
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
                return listSatuan.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.jenisAsetCont,
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
              // onSelected: (String value) {
              //   controller.jenisAsetCont.text = value;
              // },
              itemBuilder: (BuildContext context) {
                return listJenis.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.lokasiAsetCont,
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
                return listLokasi.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
                  primary: const Color.fromARGB(255, 47, 48, 128),
                ),
                onPressed: () => controller.addAsset(
                    controller.asetNameCont.text,
                    controller.jumlahAsetCont.text,
                    controller.jenisAsetCont.text,
                    controller.satuanAsetCont.text,
                    controller.lokasiAsetCont.text,
                    controller.kategoriAsetCont.text,
                    controller.catatanAsetCont.text),
                child: const Text("ADD ASET"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
