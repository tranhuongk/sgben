import 'package:flutter/material.dart';
import 'package:sgben/app/theme/app_colors.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height * 0.04556978);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.04556978);
    path.cubicTo(0, size.height * 0.02036393, size.width * 0.03813333, 0,
        size.width * 0.08533333, 0);
    path.lineTo(size.width * 0.3306667, 0);
    path.cubicTo(
        size.width * 0.3549333,
        0,
        size.width * 0.3754667,
        size.height * 0.008686741,
        size.width * 0.3818667,
        size.height * 0.02050641);
    path.cubicTo(
        size.width * 0.3821333,
        size.height * 0.02107604,
        size.width * 0.3824000,
        size.height * 0.02164568,
        size.width * 0.3826667,
        size.height * 0.02221532);
    path.cubicTo(
        size.width * 0.3962667,
        size.height * 0.04955710,
        size.width * 0.4432000,
        size.height * 0.06977869,
        size.width * 0.4986667,
        size.height * 0.06977869);
    path.cubicTo(
        size.width * 0.5544000,
        size.height * 0.06977869,
        size.width * 0.6013333,
        size.height * 0.04941476,
        size.width * 0.6146667,
        size.height * 0.02178802);
    path.lineTo(size.width * 0.6146667, size.height * 0.02164568);
    path.cubicTo(
        size.width * 0.6146667,
        size.height * 0.02136086,
        size.width * 0.6149333,
        size.height * 0.02121838,
        size.width * 0.6149333,
        size.height * 0.02093357);
    path.cubicTo(size.width * 0.6213333, size.height * 0.008829150,
        size.width * 0.6421333, 0, size.width * 0.6666667, 0);
    path.lineTo(size.width * 0.9146667, 0);
    path.cubicTo(size.width * 0.9618667, 0, size.width,
        size.height * 0.02036393, size.width, size.height * 0.04556978);
    path.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppColors.alabaster;
    canvas.drawPath(path, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
