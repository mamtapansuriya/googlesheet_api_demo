import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.title,
      this.height,
      this.onTap,
      this.textColor,
      this.buttonColor})
      : super(key: key);
  final double? height;
  final String? title;
  final void Function()? onTap;
  final Color? textColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: height ?? 70,
        decoration: BoxDecoration(
            color: buttonColor ?? const Color(0xFF6FD289),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            title ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 1,
                color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
