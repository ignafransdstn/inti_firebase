import 'package:get/get.dart';
// import 'package:inti_firebase/binding/login_binding.dart';
import 'package:inti_firebase/controller/routes_name.dart';
import 'package:inti_firebase/view/kategori.dart';
import 'package:inti_firebase/view/list_part.dart';
import 'package:inti_firebase/view/part.dart';
import '../view/login.dart';
import '../view/home.dart';
import '../view/add.dart';
import '../view/edit.dart';

class AppPage {
  AppPage._();
  static const intials = Routes.home_screen;

  static final pages = [
    GetPage(
      name: Routes.login_screen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.home_screen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.add_screen,
      page: () => AddAssetView(),
    ),
    GetPage(
      name: Routes.edit_screen,
      page: () => EditAssetView(),
    ),
    GetPage(
      name: Routes.menu_screen,
      page: () => const KategoriView(),
    ),
    GetPage(
      name: Routes.add_part_screen,
      page: () => AddPartView(),
    ),
    GetPage(
      name: Routes.list_part_screen,
      page: () => ListPartScreen(),
    ),
  ];
}
