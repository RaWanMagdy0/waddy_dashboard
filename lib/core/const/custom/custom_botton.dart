import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width, height, maxWidth, maxHeight, borderRadius;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? color, textColor, disabledColor, borderColor, backgroundColor,disabledBackgroundColor;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    this.onPressed,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.borderRadius,
    this.text,
    this.textStyle,
    this.child,
    this.color,
    this.textColor,
    this.disabledColor,
    this.borderColor,
    this.padding,
    this.backgroundColor,
    this.disabledBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 45.h),
        backgroundColor: backgroundColor ?? color,
        disabledBackgroundColor: disabledColor??color,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.w,
          ),
        ),
      ),
      child: child ?? Text(
        text ?? '',
        style: textStyle?.copyWith(color: textColor) ?? TextStyle(color: textColor),
      ),
    );
  }
}