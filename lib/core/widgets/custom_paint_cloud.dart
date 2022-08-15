import 'package:flutter/material.dart';

class CustomPaintCloud extends StatelessWidget {
  final Color color;
  const CustomPaintCloud({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double WIDTH = 35;
    return CustomPaint(
      size: Size(
          WIDTH,
          (WIDTH * 1)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(color: color),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final Color color;
  RPSCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.9375000);
    path_0.cubicTo(size.width * 0.7761250, size.height * 0.9375000, size.width,
        size.height * 0.7416250, size.width, size.height * 0.5000000);
    path_0.cubicTo(
        size.width,
        size.height * 0.2583750,
        size.width * 0.7761250,
        size.height * 0.06250000,
        size.width * 0.5000000,
        size.height * 0.06250000);
    path_0.cubicTo(size.width * 0.2238750, size.height * 0.06250000, 0,
        size.height * 0.2583750, 0, size.height * 0.5000000);
    path_0.cubicTo(
        0,
        size.height * 0.6100000,
        size.width * 0.04643750,
        size.height * 0.7106250,
        size.width * 0.1231250,
        size.height * 0.7875000);
    path_0.cubicTo(
        size.width * 0.1170630,
        size.height * 0.8510000,
        size.width * 0.09706250,
        size.height * 0.9206250,
        size.width * 0.07493750,
        size.height * 0.9728750);
    path_0.cubicTo(
        size.width * 0.07000000,
        size.height * 0.9845000,
        size.width * 0.07956250,
        size.height * 0.9975000,
        size.width * 0.09200000,
        size.height * 0.9955000);
    path_0.cubicTo(
        size.width * 0.2330000,
        size.height * 0.9723750,
        size.width * 0.3168120,
        size.height * 0.9368750,
        size.width * 0.3532500,
        size.height * 0.9183750);
    path_0.cubicTo(
        size.width * 0.4011190,
        size.height * 0.9311420,
        size.width * 0.4504570,
        size.height * 0.9375720,
        size.width * 0.5000000,
        size.height * 0.9375000);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.9375000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
