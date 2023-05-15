import 'package:get/get.dart';
import 'package:test/modules/home_binding.dart';
import 'package:test/modules/home_page.dart';
import 'package:test/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}