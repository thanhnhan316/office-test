import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WidgetButton extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final Color color;
  final Widget funtion;

  WidgetButton(@required this.width, @required this.height, @required this.name,
      @required this.color, @required this.funtion);

  @override
  Widget build(BuildContext context) {
    // có thể vuốt, chạm, lắc
    return GestureDetector(
      child: Card(
        color: Colors.transparent,
        elevation: 20,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(
                  colors: [
                    BACKGROUND,
                    Colors.yellow,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialWithModalsPageRoute(builder: (context) => funtion));
      },
    );
  }
}
