import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/exam/exam_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/tests/test.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  _ExamcreenState createState() => _ExamcreenState();
}

class _ExamcreenState extends State<ExamScreen> with ResponsiveWidget {
  late ExamViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ExamViewModel>(
      viewModel: ExamViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel!..init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.3),
          appBar: AppBar(
            title: Text('Các bộ đề thi'),
            backgroundColor: BACKGROUND,
          ),
          body: buildUi(context: context),
        );
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return _buildExam();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildExam();
  }

  Widget _buildExam() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String Date = formatter.format(now);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buidTestExam(1, '$Date', 10, TestScreen()),
            buidTestExam(2, '$Date', 10, TestScreen()),
            buidTestExam(3, '$Date', 10, TestScreen()),
            buidTestExam(4, '$Date', 10, TestScreen()),
            buidTestExam(5, '$Date', 10, TestScreen()),
          ],
        ),
      ),
    );
  }
}

Widget buidTestExam(int number, String nowDate, int point, Widget widget) {
  return GestureDetector(
    onTap: () {
      Get.to(widget);
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(20),
      height: Get.height * 0.2,
      width: Get.width,
      decoration:
          BoxDecoration(color: WHITE, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('$number', style: TextStyle(fontSize: 30, color: BACKGROUND)),
          SizedBox(width: 20),
          Column(
            children: [
              Text('Bộ đề số $number', style: TextStyle(fontSize: 20)),
              SizedBox(height: 5),
              Container(
                height: 1,
                width: Get.width * 0.7,
                color: BACKGROUND,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('30 Câu'),
                  SizedBox(width: 20),
                  Icon(
                    Icons.lock_clock,
                    color: BACKGROUND,
                  ),
                  SizedBox(width: 10),
                  Text('30 Phút')
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: BACKGROUND,
                  ),
                  SizedBox(width: 10),
                  Text('Lần tập luyện gần nhất : $nowDate')
                ],
              ),
              Text('Điểm cao nhất : $point')
            ],
          )
        ],
      ),
    ),
  );
}
