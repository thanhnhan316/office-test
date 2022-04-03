import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SplashViewModel extends BaseViewModel {
  final TextEditingController controller = TextEditingController();
  init() async {}

  void goToHome() async {
    var result = await Get.toNamed(Routers.home);
    print(result);
  }

  Stream<int> abc() async* {
    yield 2;
  }

  void valid() {
    if (controller.text != null || controller.text == null) {}
  }
}
