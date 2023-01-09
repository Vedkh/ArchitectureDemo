// ignore_for_file: library_private_types_in_public_api

import 'package:archdemo/ui/tools/theme_colors.dart';
import 'package:flutter/material.dart';


class DemoSwitch extends StatefulWidget {
  final void Function(bool isEnabled) onSwitched;
  final double height;
  final double width;
  final Color enabledColor;
  final Color disabledColor;
  final bool isOn;

  const DemoSwitch({Key? key, required this.height, required this.width, required this.enabledColor,
    required this.disabledColor, required this.isOn, required this.onSwitched}) : super(key: key);

  @override
  _DemoSwitchState createState() => _DemoSwitchState();
}

class _DemoSwitchState extends State<DemoSwitch> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: _DemoSwitchPainter(widget.isOn, widget.enabledColor, widget.disabledColor),
        ),
      ),
      onTap: () => setState((){
        isOn = !isOn;
        widget.onSwitched(isOn);
      }),
    );
  }
}

class _DemoSwitchPainter extends CustomPainter {
  final bool isEnabled;
  final Color enabledColor;
  final Color disabledColor;
  _DemoSwitchPainter(this.isEnabled, this.enabledColor, this.disabledColor);

  @override
  void paint(Canvas canvas, Size size) {
    Color color = isEnabled ? enabledColor : disabledColor;
    Paint borderPaint = Paint();
    //borderPaint.color = color;
    borderPaint.color = ThemeColors.neutral;
    borderPaint.style = PaintingStyle.stroke;
    borderPaint.strokeWidth = 1.0;
    double radius = size.height / 2.0;
    canvas.drawRRect(RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
        topLeft: Radius.circular(radius), topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)), borderPaint);

    Paint circlePaint = Paint();
    circlePaint.color = color;
    circlePaint.style = PaintingStyle.fill;
    double circleRadius = size.height / 2.0 - 4.0;
    double centerPosition;
    if(isEnabled){
      centerPosition = size.width - circleRadius - 3.0;
    } else {
      centerPosition = circleRadius + 3.0;
    }
    canvas.drawCircle(Offset(centerPosition, circleRadius + 4.0), circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}