import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/tests/model_tests/anwser.dart';
import 'package:flutter_app/src/presentation/tests/model_tests/qestion.dart';
import 'package:flutter_app/src/presentation/tests/test_viewmodel.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestcreenState createState() => _TestcreenState();
}

class _TestcreenState extends State<TestScreen> with ResponsiveWidget {
  late TestViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TestViewModel>(
      viewModel: TestViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel!..init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.3),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.description),
                SizedBox(width: 10),
                GestureDetector(onTap: () {}, child: Text('Nộp bài')),
              ],
            ),
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
    return _buildTest();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildTest();
  }

  Widget _buildTest() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [_buildHead(), Expanded(child: numbersTest())],
      ),
    );
  }

  Widget _buildHead() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Số câu : 0/30',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Row(
            children: [
              Icon(Icons.history),
              SizedBox(width: 5),
              Text('30:00',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  List<Question> listQuestion = fakeQuestion();
  Widget numbersTest() {
    print("LIST" + listQuestion.length.toString());
    print("LIST ANS" + listQuestion[0].anwser.length.toString());
    return ListView.builder(
        itemCount: listQuestion.length,
        itemBuilder: (context, index) {
          return buildTest(
              listQuestion[index].question, listQuestion[index].anwser);
        });
  }

  Widget buildTest(String question, List<Anwser> answer) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      width: Get.width * 0.9,
      child: Column(
        children: [
          Text('$question', style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: 10),
          Container(
            width: Get.width * 0.8,
            height: 1,
            color: BACKGROUND,
          ),
          ...answer.map((e) => testAnwser(e)).toList()
        ],
      ),
      decoration:
          BoxDecoration(color: WHITE, borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget testAnwser(Anwser anwser) {
    var isChecker = false;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 25),
            Checkbox(
              activeColor: BACKGROUND,
              checkColor: WHITE,
              value: false,
              onChanged: (newValue) {
                setState(() {
                  isChecker = newValue!;
                });
              },
            ),
            SizedBox(width: 10),
            Text('$anwser', style: TextStyle(fontSize: 15)),
          ],
        ),
      ],
    );
  }
}
