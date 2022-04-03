import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/home/home_screen.dart';
import 'package:flutter_app/src/presentation/review/review_viewmodel.dart';

import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewcreenState createState() => _ReviewcreenState();
}

class _ReviewcreenState extends State<ReviewScreen> with ResponsiveWidget {
  late ReviewViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ReviewViewModel>(
      viewModel: ReviewViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel!..init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Ôn tập'),
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
    return _buildReview();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildReview();
  }

  Widget _buildReview() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                itemMenu(Icon(Icons.legend_toggle_outlined), 'WORD', BLUECOLOR,
                    HomeScreen()),
                SizedBox(width: 20),
                itemMenu(Icon(Icons.explicit_outlined), 'EXCEL', GREENCOLOR,
                    HomeScreen()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(height: 20),
                itemMenu(
                    Icon(Icons.power), 'POWER POINT', BACKGROUND, HomeScreen()),
                SizedBox(width: 20),
                itemMenu(Icon(Icons.disc_full_outlined), 'TẤT CẢ', Colors.grey,
                    HomeScreen())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget itemMenu(
    Icon icons,
    String text,
    Color color,
    Widget function,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(function);
      },
      child: Card(
        elevation: 15,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(10),
          width: Get.width * 0.38,
          height: Get.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons.icon,
                size: Get.width * 0.2,
                color: WHITE,
              ),
              Text(
                '$text',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
