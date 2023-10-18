// ignore_for_file: constant_identifier_names

import 'package:drop_number_game/constants/getx_binding.dart';
import 'package:drop_number_game/pages/home/ui/home_page.dart';
import 'package:get/get.dart';
class Routes {
  static const String HOME = '/HOME';
}

List<GetPage> pages = [
  GetPage(
    name: Routes.HOME,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
];
