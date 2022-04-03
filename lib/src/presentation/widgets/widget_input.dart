import 'package:flutter/material.dart';

class WidgetInput extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final Icon icons;
  var inputControler = TextEditingController();

  WidgetInput(@required this.height, @required this.width, @required this.name,
      @required this.icons);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //chinh text name thanh in hoa
          name.toUpperCase(),
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              //độ mờ của color
              color: Colors.black.withOpacity(0.6)),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(icons.icon),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: inputControler,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Colors.black.withOpacity(0.3)),
                        labelText: '$name ',
                        border: InputBorder.none),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
