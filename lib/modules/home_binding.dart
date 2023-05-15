import 'package:get/get.dart';
import 'package:test/modules/home_controller.dart';
import 'package:test/modules/test_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TestController());
  }
}