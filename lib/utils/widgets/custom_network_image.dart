
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';

import '../utility.dart';

class CustomNetworkImage extends StatefulWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? boxFit;
  final ImageWidgetBuilder? imageWidgetBuilder;
  final PlaceholderWidgetBuilder? placeholderWidgetBuilder;
  final BoxConstraints? constraints;

  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.boxFit,
    this.imageWidgetBuilder,
    this.placeholderWidgetBuilder,
    this.constraints
  });

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl == null || widget.imageUrl!.isEmpty || Utility.isVideo(widget.imageUrl!)) {
      return ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: Container(
          width: widget.width,
          height: widget.height,
          constraints: widget.constraints,
          decoration: const BoxDecoration(color: AppColor.silverColor),
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            AppImages.placeholderImage,
            fit: widget.boxFit,
          ),
        ),
      );
    }
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl!,
          height: widget.height,
          width: widget.width,
          fit: widget.boxFit,
          imageBuilder: widget.imageWidgetBuilder,
          placeholder: widget.placeholderWidgetBuilder ??
              (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      color: Colors.white,
                    ),
                  ),
          errorWidget: (context, url, error) => ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: Image.asset(
              AppImages.placeholderImage,
              width: widget.width,
              height: widget.height,
              fit: widget.boxFit,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFileImage extends StatelessWidget {
  final String? filePath;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? boxFit;

  const CustomFileImage({
    super.key,
    this.filePath,
    this.height,
    this.width,
    this.borderRadius,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    if (filePath == null || filePath!.isEmpty || !File(filePath!).existsSync()) {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: AppColor.silverColor),
        padding: const EdgeInsets.all(16),
        child: Image.asset(
          AppImages.placeholderImage,
          fit: boxFit,
        ),
      );
    }
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.file(
        File(filePath!),
        height: height,
        width: width,
        fit: boxFit,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          AppImages.placeholderImage,
          width: width,
          height: height,
          fit: boxFit,
        ),
      ),
    );
  }
}
