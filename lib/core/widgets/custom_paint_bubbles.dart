import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CustomPaintBubbles extends StatelessWidget {
  const CustomPaintBubbles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double WIDTH = 50;
    return CustomPaint(
      size: Size(
          WIDTH,
          (WIDTH * 1.728110599078341)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(0.4);
    canvas.drawCircle(Offset(size.width * 0.4262673, size.height * 0.9213333),
        size.width * 0.5737327, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.black.withOpacity(0.4);
    canvas.drawCircle(Offset(size.width * 0.3041475, size.height * 0.3866667),
        size.width * 0.1797235, paint_1_fill);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.black.withOpacity(0.4);
    canvas.drawCircle(Offset(size.width * 0.7419355, size.height * 0.1040000),
        size.width * 0.1797235, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
