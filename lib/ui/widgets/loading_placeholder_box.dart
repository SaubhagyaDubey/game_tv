import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

class LoadingAnimatedBorder extends StatefulWidget {
  final Color borderColor;
  final Widget child;
  final Duration duration;
  final double borderWidth;
  final EdgeInsets padding;
  final double cornerRadius;
  final bool startWithRandomPosition;
  final Function controller;
  final Color trailingBorderColor;
  final bool isTrailingTransparent;

  const LoadingAnimatedBorder({
    @required this.borderColor,
    @required this.child,
    Key key,
    this.duration,
    this.borderWidth = 6,
    this.padding = EdgeInsets.zero,
    this.cornerRadius = 18.0,
    this.startWithRandomPosition = true,
    this.trailingBorderColor = Colors.black,
    this.controller,
    this.isTrailingTransparent = false,
  }) : super(key: key);

  @override
  _LoadingAnimatedBorderState createState() => _LoadingAnimatedBorderState();
}

class _LoadingAnimatedBorderState extends State<LoadingAnimatedBorder>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Color borderColor = Colors.transparent;

  @override
  void didUpdateWidget(LoadingAnimatedBorder oldWidget) {
    if (oldWidget != oldWidget) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
    )..addStatusListener((status) {
        // Use to hide animation, While passing child widget to this widget
        if (status == AnimationStatus.reverse) {
          setState(() {
            borderColor = Colors.transparent;
          });
        }
      });
    _controller.repeat();
    if (widget.controller != null) {
      widget.controller(_controller);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BorderPainter(
          animation: _controller,
          color: borderColor,
          cornerRadius: widget.cornerRadius,
          borderWidth: widget.borderWidth,
          trailingBorderColor: widget.trailingBorderColor,
          isTrailingTransparent: widget.isTrailingTransparent,
          randomNum: widget.startWithRandomPosition ? getRandomNumber() : 0),
      child: Padding(
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }

  int getRandomNumber() {
    var random = Random();
    return (random.nextInt(20) + 6);
  }
}

class _BorderPainter extends CustomPainter {
  final Animation animation;
  final Color color;
  final double borderWidth;
  final double cornerRadius;
  final int randomNum;
  final Color trailingBorderColor;
  final bool isTrailingTransparent;

  _BorderPainter({
    this.animation,
    this.color = Colors.white,
    this.borderWidth = 1.5,
    this.cornerRadius = 12.0,
    this.randomNum = 2,
    this.isTrailingTransparent,
    this.trailingBorderColor,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()..color = Colors.transparent;
    final progress = animation.value;
    if (progress > 0.0) {
      paint.color = trailingBorderColor;
      paint.shader = SweepGradient(
        colors: [
          isTrailingTransparent ? color.withOpacity(0.1) : Colors.transparent,
          color,
          Colors.transparent,
        ],
        stops: [
          0.0,
          1.0,
          1.0,
        ],
        startAngle: math.pi / 8,
        endAngle: math.pi / 2,
        transform: GradientRotation((math.pi * 2 * progress) + randomNum),
      ).createShader(rect);
    }
    var rRect = RRect.fromRectAndRadius(rect, Radius.circular(cornerRadius));

    final path = Path()..addRRect(rRect);
    canvas.drawRRect(
        rRect,
        paint
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_BorderPainter oldDelegate) => true;

  double getRandomNumber() {
    var random = Random();
    return (random.nextInt(5) + 3).toDouble();
  }
}
