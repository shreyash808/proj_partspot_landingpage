import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/classes/value_controller.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/styles/border_styles.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class AppTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? hint;
  final String? title;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final String? error;
  final int? maxLength;
  final bool showMaxLength;
  final bool obscureText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final Color? backgroundColor;
  final String? prefixIcon;
  final String? suffixIconPath;
  final Color? suffixIconColor;
  final bool showSuffixBackground;
  final bool showPrefixBackground;
  final TextAlign? textAlign;
  final Widget? suffix;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final bool? readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final String? initialValue;
  final String? initialControllerValue;
  final Widget? prefix;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTapSuffix;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final Function(PointerDownEvent)? onTapOutSide;
  final TextStyle? hintTextStyle;
  final EdgeInsets? contentPadding;

  const AppTextField(
      {super.key,
      this.hint,
      this.inputAction,
      this.inputType = TextInputType.text,
      this.error,
      this.onChanged,
      this.backgroundColor,
      this.obscureText = false,
      this.enabled = true,
      this.prefixIcon,
      this.showSuffixBackground = true,
      this.showPrefixBackground = true,
      this.suffixIconPath,
      this.suffixIconColor,
      this.textAlign,
      this.controller,
      this.prefixWidget,
      this.suffixWidget,
      this.inputFormatters,
      this.maxLength,
      this.showMaxLength = true,
      this.padding,
      this.suffix,
      this.readOnly,
      this.onTap,
      this.validator,
      this.initialValue,
      this.initialControllerValue,
      this.prefix,
      this.onFieldSubmitted,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.onTapSuffix,
      this.maxLines = 1,
      this.hintTextStyle,
      this.focusNode,
      this.title,
      this.autoFocus,
      this.onTapOutSide,
      this.contentPadding,
      });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _controller = TextEditingController();
  ValueController<bool> hasData = ValueController(false);
  ValueController<int> wordLength = ValueController(0);

  @override
  void initState() {
    super.initState();
    if(widget.controller != null){
      _controller = widget.controller!;
    }

    if(widget.initialControllerValue?.isNotEmpty ?? false){
      _controller.text = widget.initialControllerValue ?? '';
    }

    if(_controller.text.isNotEmpty){
      hasData.updateValue(true);
    }
    _controller.addListener(() {
        hasData.updateValue( _controller.text.isNotEmpty);
        wordLength.updateValue(_controller.text.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null && widget.title!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
              child: Text(
                '${widget.title}',
                style: AppTextStyles.get16BoldTextStyle(color: AppColor.violetLightColor),
              ),
            ),
          Obx((){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.sentences, // Capitalizes the first letter of each sentence
                  onTapOutside: widget.onTapOutSide,
                  focusNode: widget.focusNode,
                  autofocus: widget.autoFocus ?? false,
                  enabled: widget.enabled,
                  controller: _controller,
                  maxLength: widget.maxLength,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.inputType,
                  textAlign: widget.textAlign == null ? TextAlign.start : widget.textAlign!,
                  textInputAction: widget.inputAction,
                  // style: AppTextStyles.get18MediumTextStyle(),
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onChanged: widget.onChanged,
                  obscureText: widget.obscureText,
                  readOnly: widget.readOnly ?? false,
                  onTap: widget.onTap,
                  validator: widget.validator,
                  autovalidateMode: widget.autoValidateMode,
                  initialValue: widget.initialValue,
                  style: AppTextStyles.get16RegularTextStyle(),
                  maxLines: widget.maxLines,
                  decoration: InputDecoration(
                    suffix: widget.suffix,
                    counterText: '',
                    prefix: widget.prefix,
                    prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null
                        ? Container(
                        padding: const EdgeInsets.only(left: 18,right: 8),
                        child: CustomSvgPicture(image: widget.prefixIcon,color: hasData.value == true ? AppColor.blackColor : AppColor.disabledBorderColor))
                        : null),
                    suffixIconConstraints:
                    const BoxConstraints(maxHeight: double.infinity),
                    suffixIcon: widget.suffixIconPath != null
                        ? InkWell(
                      onTap: widget.onTapSuffix,
                      child: Container(
                          padding: const EdgeInsets.all(17),
                          margin: const EdgeInsets.only(left: 5, right: 2),
                          child: CustomSvgPicture(image: widget.suffixIconPath,color: widget.suffixIconColor ?? (hasData.value == true ? AppColor.blackColor : AppColor.disabledBorderColor))),
                    )
                        : widget.suffixWidget,
                    contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
                    border: BorderStyles.disableTextFieldBorderStyle(radius: widget.maxLines != 1 ? 24 : 50),
                    enabledBorder: hasData.value == true
                        ? BorderStyles.focusedTextFieldBorderStyle(radius: widget.maxLines != 1 ? 24 : 50)
                        : BorderStyles.disableTextFieldBorderStyle(radius: widget.maxLines != 1 ? 24 : 50),
                    disabledBorder: BorderStyles.disableTextFieldBorderStyle(radius: widget.maxLines != 1 ? 24 : 50),
                    focusedBorder: BorderStyles.focusedTextFieldBorderStyle(radius: widget.maxLines != 1 ? 24 : 50),
                    errorText: widget.error,
                    errorMaxLines: 3,
                    errorBorder: BorderStyles.errorBorder(radius: widget.maxLines != 1 ? 24 : 50),
                    errorStyle: AppTextStyles.get14MediumTextStyle(
                        color: AppColor.errorColor),
                    hintStyle:
                    widget.hintTextStyle ?? AppTextStyles.get16RegularTextStyle(color: AppColor.disabledBorderColor),
                    filled: true,
                    hintText: widget.hint ?? '',
                    fillColor: widget.backgroundColor ?? Colors.transparent,
                  ),
                ),
                if(widget.maxLength != null && widget.showMaxLength)
                Obx((){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('${wordLength.value}/${widget.maxLength}',style: AppTextStyles.get14RegularTextStyle(color: AppColor.lightTextColor)),
                  );
                })
              ],
            );
          }),
        ]
      ),
    );
  }
}
