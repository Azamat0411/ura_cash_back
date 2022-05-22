import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  MyElevatedButton({
    Key? key,
    required this.radius,
    required this.height,
    required this.primaryColor,
    required this.width,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  double width, height, radius;
  Color primaryColor;
  Widget child;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        fixedSize: Size(
          width,
          height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
