import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/custom_colors.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({Key? key, required this.size}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20).r,
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    Paint fillBrush = Paint()..color = CustomColors.clockBG;
    Paint outlineBrush = Paint()
      ..color = CustomColors.clockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    Paint centerDotBrush = Paint()..color = CustomColors.clockOutline;

    Paint secHandBrush = Paint()
      ..color = CustomColors.secHandColor!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    Paint minHandBrush = Paint()
      ..shader = const RadialGradient(colors: [
        CustomColors.minHandStatColor,
        CustomColors.minHandEndColor
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    Paint hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [
        CustomColors.hourHandStatColor,
        CustomColors.hourHandEndColor
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    Paint dashBrush = Paint()
      ..color = CustomColors.clockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    double hourHandX = centerX +
        radius *
            0.4 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourHandY = centerY +
        radius *
            0.4 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    double minHandX =
        centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
    double minHandY =
        centerY + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    double secHandX =
        centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    double secHandY =
        centerY + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, radius * 0.12, centerDotBrush);

    double outerRadius = radius;
    double innerRadius = radius * 0.9;
    for (var i = 0; i < 360; i += 12) {
      double x1 = centerX + outerRadius * cos(i * pi / 180);
      double y1 = centerY + outerRadius * sin(i * pi / 180);

      double x2 = centerX + innerRadius * cos(i * pi / 180);
      double y2 = centerY + innerRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
