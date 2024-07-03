import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {super.key,
      required this.onTap,
      this.height = 55,
      this.width = double.infinity,
      this.colors = const [],
      this.child});
  void Function() onTap;
  double height;
  double width;
  Widget? child;
  List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: child == Text('') ? Alignment.center : Alignment.centerLeft,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: colors),
        ),
        child: child,
      ),
    );
  }
}
