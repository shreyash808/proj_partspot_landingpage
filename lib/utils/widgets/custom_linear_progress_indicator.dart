import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatefulWidget {
  final double progress; // progress from 0.0 to 1.0

  CustomLinearProgressIndicator({required this.progress});

  @override
  _CustomLinearProgressIndicatorState createState() => _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState extends State<CustomLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 20), // Height of the progress bar
      painter: _ProgressPainter(
        progress: widget.progress,
        animation: _animation.value,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ProgressPainter extends CustomPainter {
  final double progress;
  final double animation;

  _ProgressPainter({required this.progress, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;

    final Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final Paint movingPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    // Draw the background
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), backgroundPaint);

    // Draw the unmoving part (for example, 40% of the progress bar width)
    double unmovingWidth = size.width * 0.4;
    canvas.drawRect(Rect.fromLTRB(0, 0, unmovingWidth, size.height), progressPaint);

    // Draw the moving part (make it wider than the unmoving part)
    double movingWidth = size.width * 0.6 * progress * animation;
    canvas.drawRect(
        Rect.fromLTRB(unmovingWidth, 0, unmovingWidth + movingWidth, size.height), movingPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}