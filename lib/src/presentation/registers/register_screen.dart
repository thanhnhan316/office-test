import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/app_colors.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/home/home_screen.dart';
import 'package:flutter_app/src/presentation/registers/register_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_input.dart';
import 'package:flutter_app/src/presentation/widgets/widgetbutton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with ResponsiveWidget {
  late RegistersViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<RegistersViewModel>(
      viewModel: RegistersViewModel(),
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
    return _buildRegisters(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildRegisters(context);
  }

  Widget _buildRegisters(BuildContext context) {
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
          WidgetInput(50, size.width, 'Tên', Icon(Icons.people)),
          SizedBox(height: 10),
          WidgetInput(50, size.width, 'Email', Icon(Icons.email)),
          SizedBox(height: 10),
          WidgetInput(50, size.width, 'mật khẩu', Icon(Icons.lock)),
          SizedBox(height: 10),
          WidgetInput(50, size.width, 'Nhập lại mật khẩu', Icon(Icons.lock)),
          SizedBox(height: 50),
          WidgetButton(
              size.width, 50, 'Tạo tài khoản', Colors.orange, HomeScreen()),
          Expanded(
            child: Container(),
          ),
          register(),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget register() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bạn đã có tài khoản? '),
          Text(
            'Đăng nhập',
            style: TextStyle(color: BACKGROUND),
          )
        ],
      ),
    );
  }
}
