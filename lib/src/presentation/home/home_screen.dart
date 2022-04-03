import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/exam/exam_screen.dart';
import 'package:flutter_app/src/presentation/home/home_viewmodel.dart';
import 'package:flutter_app/src/presentation/review/review_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ResponsiveWidget {
  late HomeViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel!..init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
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
    return _buildHome(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.height,
        color: Colors.white,
        child: customContainer(size),
      ),
    );
  }

  Widget customContainer(Size size) {
    return Stack(
      children: [
        Container(
            width: size.width,
            height: size.height,
            color: BACKGROUND,
            child: CustomPaint(
              painter: ShapePainter(),
            )),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Office Test',
                    style: TextStyle(fontSize: 35, color: WHITE),
                  ),
                  Text('Đăng xuất',
                      style: TextStyle(fontSize: 19, color: WHITE))
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'chào mừn bạn đến với thi trắc nghiệm \nChúc bạn học tốt ',
                  style: TextStyle(color: WHITE),
                ),
              ),
              SizedBox(height: 30),
              menu(size),
            ],
          ),
        )
      ],
    );
  }

  Widget menu(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        itemMenu1(11, 8.25),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            itemMenu(Icon(Icons.online_prediction_rounded), 'Thi Online',
                ExamScreen()),
            SizedBox(width: 20),
            itemMenu(Icon(Icons.auto_stories), 'Ôn tập', ReviewScreen()),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            itemMenu(Icon(Icons.article), 'Tài liệu', ReviewScreen()),
            SizedBox(width: 20),
            itemMenu(Icon(Icons.av_timer), 'Lịch sử', ReviewScreen()),
          ],
        )
      ],
    );
  }

  Widget itemMenu(Icon icons, String text, Widget function) {
    return GestureDetector(
      onTap: () {
        Get.to(function);
      },
      child: Card(
        elevation: 20,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(10),
          width: Get.width * 0.37,
          height: Get.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons.icon,
                size: Get.width * 0.2,
                color: BACKGROUND,
              ),
              Text(
                '$text',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemMenu1(int test, double point) {
  return Card(
    elevation: 20,
    color: Colors.transparent,
    child: Container(
      width: Get.width * 0.83,
      height: Get.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height * 0.15,
                    width: Get.height * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: BACKGROUND, width: 9)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_stories,
                            color: BACKGROUND,
                          ),
                          Text('$test',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: BACKGROUND,
                                  fontWeight: FontWeight.bold)),
                          Text('Đề',
                              style: TextStyle(fontSize: 22, color: BACKGROUND))
                        ],
                      ),
                    ),
                  ),
                  Text('Số đề đã giải',
                      style: TextStyle(fontSize: 15, color: BACKGROUND))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height * 0.15,
                    width: Get.height * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: BACKGROUND, width: 9)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.note_alt_outlined,
                            color: BACKGROUND,
                          ),
                          Text('$point',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: BACKGROUND,
                                  fontWeight: FontWeight.bold)),
                          Text('Điểm',
                              style: TextStyle(fontSize: 22, color: BACKGROUND))
                        ],
                      ),
                    ),
                  ),
                  Text('Điểm cao nhất',
                      style: TextStyle(fontSize: 15, color: BACKGROUND))
                ],
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = WHITE
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.4, size.width, size.height * 0.18);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
