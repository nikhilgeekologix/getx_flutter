import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = Colors.lightBlue,
    this.textColor = Colors.white,
    this.loading = false,
    required this.title,
    this.height = 60,
    this.width = 50,
    required this.onPress,
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Center(
                child: Text(
                  title,
                  style: TextStyle(color: textColor),
                ),
              ),
      ),
    );
  }
}
