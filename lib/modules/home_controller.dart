import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageName = 'Scrollable AppBar'.obs;
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