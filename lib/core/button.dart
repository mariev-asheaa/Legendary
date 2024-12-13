import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({super.key,required this.ontap,required this.label
    ,required this.color,
    this.w=300,
    this.h=50,  this.style});
  final String label;
  final Color color;
  double w,h;
  final TextStyle? style;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: ontap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20)
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(label,
                        style: style
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}
