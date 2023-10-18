import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';

class CustomWeatherBoxWidget extends StatelessWidget {
  const CustomWeatherBoxWidget({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    this.maxWidth,
  });

  final double height;
  final double width;
  final double? maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomWeatherBoxPainter(
        boxSurfaceColor: Clr.of(context).surfaceContainer,
        boxBorderColor: Clr.of(context).outlineVariant,
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? width),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}

class CustomWeatherBoxPainter extends CustomPainter {
  const CustomWeatherBoxPainter({required this.boxSurfaceColor, required this.boxBorderColor});

  final Color boxSurfaceColor;
  final Color boxBorderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(size.width * 0.1002506, 0);
    path.cubicTo(size.width * 0.04488371, 0, 0, size.height * 0.07309633, 0, size.height * 0.1632653);
    path.lineTo(0, size.height * 0.8367347);
    path.cubicTo(0, size.height * 0.9269034, size.width * 0.04488371, size.height, size.width * 0.1002506, size.height);
    path.lineTo(size.width * 0.3642439, size.height);
    path.lineTo(size.width * 0.4043442, size.height);
    path.lineTo(size.width * 0.8997494, size.height);
    path.cubicTo(
        size.width * 0.9551128, size.height, size.width, size.height * 0.9269034, size.width, size.height * 0.8367347);
    path.lineTo(size.width, size.height * 0.6027211);
    path.cubicTo(size.width, size.height * 0.5125524, size.width * 0.9551128, size.height * 0.4394558,
        size.width * 0.8997494, size.height * 0.4394558);
    path.lineTo(size.width * 0.6048454, size.height * 0.4394558);
    path.cubicTo(size.width * 0.5494787, size.height * 0.4394558, size.width * 0.5045948, size.height * 0.3663592,
        size.width * 0.5045948, size.height * 0.2761905);
    path.lineTo(size.width * 0.5045948, size.height * 0.1632653);
    path.cubicTo(
        size.width * 0.5045948, size.height * 0.07309633, size.width * 0.4597109, 0, size.width * 0.4043442, 0);
    path.lineTo(size.width * 0.1002506, 0);
    path.close();

    canvas.drawShadow(path, boxSurfaceColor, 3, true);

    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = boxSurfaceColor;
    canvas.drawPath(path, paintFill);

    final paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..color = boxBorderColor
      ..strokeWidth = 1.0;
    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
