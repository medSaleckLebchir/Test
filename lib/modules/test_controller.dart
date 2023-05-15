import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  final pageName = 'Thick Shake'.obs;
  final pageNameEditingController = TextEditingController();

  updatePageName(String name) {
    pageName.value = name;
  }

  @override
  void dispose() {
    pageNameEditingController.dispose();
    super.dispose();
  }
}