
import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:partyspot/utils/widgets/text_view.dart';


PopUpMenuDividerWidget get popUpDivider => const PopUpMenuDividerWidget(
    child: Divider(
      height: 0,
      endIndent: 10,
      indent: 10,
    ),
  );

class PopUpMenuDividerWidget extends PopupMenuItem<Widget> {
  const PopUpMenuDividerWidget({
    super.key,
    required super.child,
  });

  @override
  double get height => 0;
}


class AppPopUpMenu extends StatelessWidget {
  final List<PopupMenuItem<Widget>> items;
  final Widget? icon;
  final Offset? offset;
  final Color? iconColor;
  final double? iconSize;
  final Color? surfaceTintColor;
  final Color? color;
  final void Function()? onOpened;
  final void Function()? onClosed;
  final void Function(Widget)? onSelected;

  const AppPopUpMenu({
    super.key,
    required this.items,
    this.icon,
    this.offset,
    this.iconColor,
    this.iconSize,
    this.surfaceTintColor,
    this.color,
    this.onOpened,
    this.onClosed,
    this.onSelected
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      onOpened: onOpened,
      onCanceled: onClosed,
      surfaceTintColor: surfaceTintColor ?? Colors.white,
      color: color ?? Colors.white,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      icon: icon ??
          Icon(
            Icons.more_horiz,
            size: iconSize ?? 32,
            color: iconColor ?? AppColor.greyColor,
          ),
      padding: EdgeInsets.zero,
      offset: offset ?? Offset.zero,
      itemBuilder: (BuildContext context) => items,
    );
  }
}

class PopUpMenuItemText extends PopupMenuItem<Widget> {
  final String text;
  final String icon;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? iconColor;

  const PopUpMenuItemText({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    this.textColor,
    this.iconColor,
  }) : super(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: null, // The child will be set dynamically
  );

  @override
  PopupMenuItemState<Widget, PopupMenuItem<Widget>> createState() {
    return _CustomPopupMenuItemState();
  }
}

class _CustomPopupMenuItemState extends PopupMenuItemState<Widget, PopUpMenuItemText> {
  @override
  Widget buildChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          widget.text,
          style: TextStyle(
            color: widget.textColor ?? Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        AppSizes.widthBox(boxWidth: 15),
        CustomSvgPicture(
          iconPath: widget.icon,
          color: widget.iconColor ?? widget.textColor ?? AppColor.blackColor,
        ),
      ],
    );
  }

  // @override
  // void handleTap() {
  //   super.handleTap();
  //   widget.onTap?.call();
  // }
}