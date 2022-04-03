import 'package:flutter_app/src/presentation/tests/model_tests/qestion.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class TestViewModel extends BaseViewModel {
  List<Question> listQuestion = <Question>[];
  init() async {
    listQuestion.addAll(fakeQuestion());
  }
}
