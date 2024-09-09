import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';
import '../GlobalVariables/globalVariables.dart';
import 'Text/textSmall.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonTextType;
  final Color textTypeColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderThickness;
  final bool isFullButtonWidthRequired;
  final bool isLoading;
  final Color buttonBackgroundColor;
  final VoidCallback? onClickFunction;

  const CustomTextButton({
    required this.buttonTextType,
    required this.textTypeColor,
    this.borderRadius,
    this.borderColor,
    this.borderThickness,
    required this.isFullButtonWidthRequired,
    required this.isLoading,
    required this.buttonBackgroundColor,
    this.onClickFunction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isFullButtonWidthRequired ? Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight.r),
        color: Colors.transparent,
      ),
      child: TextButton(
            onPressed: onClickFunction,
            style: TextButton.styleFrom(
              elevation: SizeGlobalVariables.one_point_two,
              backgroundColor: buttonBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight.r),
                side: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: borderThickness ?? SizeGlobalVariables.zero.w,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text
                TextSmall(
                  title: buttonTextType,
                  textColor: textTypeColor, fontWeight: FontWeight.normal,
                ),
                isLoading ? SizedBox(width: SizeGlobalVariables.double_size_eight.w,) : const SizedBox(),
                // circular progress indicator
                isLoading ? SizedBox(
                  width: SizeGlobalVariables.double_size_sixteen.w,
                  height: SizeGlobalVariables.double_size_sixteen.w,
                  child: CircularProgressIndicator(
                    color: GlobalVariables.whiteColor,
                    strokeWidth: SizeGlobalVariables.double_size_two.w,
                  ),
                ) : const SizedBox(),
              ],
            ),
          ),
    ) : Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight.r),
        color: Colors.transparent,
      ),
      child: TextButton(
        onPressed: onClickFunction,
        style: TextButton.styleFrom(
          elevation: SizeGlobalVariables.one_point_two,
          backgroundColor: buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderThickness ?? SizeGlobalVariables.zero.w,
            ),
          ),
        ),
        child: TextSmall(
          title: buttonTextType,
          textColor: textTypeColor, fontWeight: FontWeight.normal,
        ),
      ),);
  }
}
