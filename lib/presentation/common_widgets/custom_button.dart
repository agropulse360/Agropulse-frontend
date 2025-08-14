import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget{
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = const Color(0xFF333333),
    this.borderRadius = 10.0,
    this.height = 50.0,
    });

    final String text;
    final void Function() onPressed;
    final Color color;
    final Color textColor;
    final double borderRadius;
    final double height;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius))
        ), 
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}