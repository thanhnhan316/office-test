import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/home/home_screen.dart';
import 'package:flutter_app/src/presentation/registers/register_screen.dart';
import 'package:flutter_app/src/presentation/splash/splash.dart';
import 'package:flutter_app/src/presentation/widgets/widget_input.dart';
import 'package:flutter_app/src/presentation/widgets/widgetbutton.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ResponsiveWidget {
  late SplashViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      viewModel: SplashViewModel(),
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
    return _buildScreenLogin(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildScreenLogin(context);
  }

  Widget _buildScreenLogin(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.grey[350],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Office Test',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 60),
          WidgetInput(50, size.width, 'Email', Icon(Icons.email)),
          SizedBox(height: 10),
          WidgetInput(50, size.width, 'Password', Icon(Icons.lock)),
          SizedBox(height: 70),
          WidgetButton(size.width, 50, 'Login', BACKGROUND, HomeScreen()),
          SizedBox(height: 30),
          line(size),
          SizedBox(height: 30),
          WidgetButton(size.width, 50, 'Facebook', BACKGROUND, HomeScreen()),
          SizedBox(height: 30),
          Expanded(child: register()),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget line(Size size) {
    return Row(
      children: [
        Expanded(
            child:
                Container(height: 1, width: size.width, color: Colors.black)),
        Text('  hoặc đăng nhập với  '),
        Expanded(
            child: Container(height: 1, width: size.width, color: Colors.black))
      ],
    );
  }

  Widget register() {
    return GestureDetector(
      onTap: () {
        Get.to(RegisterScreen());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bạn chưa có tài khoản? '),
          Text(
            'Đăng ký',
            style: TextStyle(color: BACKGROUND),
          )
        ],
      ),
    );
  }
}
