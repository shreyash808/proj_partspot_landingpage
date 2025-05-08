import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/widgets/circular_button_widget.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:partyspot/utils/widgets/text_view.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Color? backButtonColor;
  final bool? hasArrow;
  final VoidCallback? onBackPressed;
  final Widget? titleWidget;
  final Color? toolbarBackgroundColor;
  final List<Widget>? actions;
  final bool? centerTitle;
  final PreferredSizeWidget? bottomWidget;
  final double? toolBarHeight;
  final String? backIcon;

  const CustomAppBar(
      {super.key,
      this.title,
      this.titleColor,
      this.hasArrow = false,
      this.onBackPressed,
      this.actions,
      this.titleWidget,
      this.toolbarBackgroundColor,
      this.centerTitle = true,
      this.bottomWidget,
      this.backButtonColor,
      this.backIcon,
      this.toolBarHeight});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize, // Set the height you want
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light,
        ),
        toolbarHeight: toolBarHeight,
        leading: Visibility(
          visible: (hasArrow ?? false) && Navigator.canPop(context),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: OutlinedCircularButton(
                color: backButtonColor ?? AppColor.tertiaryColor,
                onTap: () {
                  Get.back();
                },
                child: CustomSvgPicture(
                  image: backIcon ?? AppIcons.icArrowBack,
                  color: backButtonColor,
                )),
          ),
        ),
        scrolledUnderElevation: 0,
        centerTitle: centerTitle,
        elevation: 0,
        title: titleWidget ??
            TextView(
              title ?? '',
              style: AppTextStyles.get18BoldTextStyle(color: titleColor),
            ),
        backgroundColor: toolbarBackgroundColor ?? Colors.transparent,
        actions: actions,
        // centerTitle: centerTitle,
        bottom: bottomWidget,
      ),
    );
  }
}
