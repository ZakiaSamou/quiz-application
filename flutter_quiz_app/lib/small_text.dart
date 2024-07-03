import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(this.text,
      {super.key,
      this.size = 15,
      this.weight = FontWeight.w400,
      this.color = Colors.white});
  String text;
  double size;
  FontWeight weight;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
