import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class SlideToUnlockButton extends StatefulWidget {
  final VoidCallback onSlideComplete;
  final String label;

  const SlideToUnlockButton({
    super.key,
    required this.onSlideComplete,
    this.label = "Slide to Get Started",
  });

  @override
  State<SlideToUnlockButton> createState() => _SlideToUnlockButtonState();
}

class _SlideToUnlockButtonState extends State<SlideToUnlockButton>
    with SingleTickerProviderStateMixin {
  double _position = 0.0;
  bool _isCompleted = false;
  bool _isDragging = false;
  late double maxPosition;

  @override
  Widget build(BuildContext context) {
    final double trackWidth = MediaQuery.of(context).size.width - 48;
    final double thumbSize = 65;
    maxPosition = trackWidth - thumbSize;

    return Container(
      width: trackWidth,
      height: 70,
      decoration: BoxDecoration(
        color: AppColor.borderGreyColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            width: _position + 65,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent.withOpacity(0.3),
              borderRadius: BorderRadius.circular(40),
            ),
          ),

          Center(
            child: AnimatedOpacity(
              opacity: (_isDragging || _isCompleted) ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                widget.label,
                style: AppTextStyles.get20SemiBoldTextStyle(
                  color: AppColor.buttonOrange,
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 0),
            left: _position,
            child: GestureDetector(
              onHorizontalDragStart: (_) {
                if (_isCompleted) return;
                setState(() {
                  _isDragging = true;
                });
              },
              onHorizontalDragUpdate: (details) {
                if (_isCompleted) return;
                setState(() {
                  _position += details.delta.dx;
                  _position = _position.clamp(0.0, maxPosition);
                });
              },
              onHorizontalDragEnd: (_) {
                if (_position >= maxPosition * 0.9) {
                  setState(() {
                    _position = maxPosition;
                    _isCompleted = true;
                    _isDragging = false;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    widget.onSlideComplete();
                  });
                } else {
                  setState(() {
                    _position = 0.0;
                    _isDragging = false;
                  });
                }
              },
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: const BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
