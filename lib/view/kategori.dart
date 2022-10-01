import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controller/routes_name.dart';

class KategoriView extends GetView<KategoriView> {
  const KategoriView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KATEGORI"),
        backgroundColor: const Color.fromARGB(255, 47, 48, 128),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 98, 99, 194),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(50),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 47, 48, 128),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    splashColor: const Color.fromARGB(255, 98, 99, 194),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => Get.toNamed(Routes.add_screen),
                          icon: const Icon(Icons.radio),
                          iconSize: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 47, 48, 128),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    splashColor: const Color.fromARGB(255, 98, 99, 194),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => Get.toNamed(Routes.add_part_screen),
                          icon: const FaIcon(FontAwesomeIcons.whmcs),
                          iconSize: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
