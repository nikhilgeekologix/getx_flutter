import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/image_assets.dart';

class InternetExceptionsWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionsWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionsWidget> createState() =>
      _InternetExceptionsWidgetState();
}

class _InternetExceptionsWidgetState extends State<InternetExceptionsWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .15.h,
            ),
            const Icon(
              Icons.cloud_off,
              color: Colors.red,
              size: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                "We are unable show result. \nPlease check your data \nconnection.",
                style: TextStyle(fontSize: 14),
              )),
            ),
            SizedBox(
              height: height * .15,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: widget.onPress,
                child: Container(
                  height: 44.w,
                  width: 160.h,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "Retry",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
