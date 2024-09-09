
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';
import '../../GlobalVariables/globalVariables.dart';
import '../Text/textExtraSmall.dart';
import '../Text/textSmall.dart';
import '../customIcon.dart';

class Links extends StatelessWidget {
  final String linkTextType;
  final Color linkTextColor;
  final bool isTextSmall;
  final bool isIconWidgetRequiredAtEnd;
  final bool isIconWidgetRequiredAtFront;
  final VoidCallback onClickFunction;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final FontWeight? linkFontWeight;
  final IconData? iconData;
  final Color? iconColor;

  const Links({
    required this.linkTextType,
    required this.linkTextColor,
    required this.isTextSmall,
    required this.isIconWidgetRequiredAtEnd,
    required this.isIconWidgetRequiredAtFront,
    this.textDecoration,
    this.textDecorationColor,
    required this.onClickFunction,
    this.linkFontWeight,
    this.iconData,
    this.iconColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClickFunction,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(SizeGlobalVariables.double_size_five.w),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_five.r),
        ),
      ),
      child: Row(
        children: [
          // front icon
          isIconWidgetRequiredAtFront ? CustomIcon(
            iconData: iconData ?? Icons.edit,
            iconColor: iconColor ?? GlobalVariables.buttonColor,
          ) : const SizedBox(),
          SizedBox(width: SizeGlobalVariables.double_size_four.w,),
          // iconTextType
          isTextSmall ? TextSmall(
            title: linkTextType,
            fontWeight: linkFontWeight ?? FontWeight.normal,
            textColor: linkTextColor,
            textDecoration: textDecoration ?? TextDecoration.underline,
            textDecorationColor: textDecorationColor ?? GlobalVariables.blackColor,
          ) : TextExtraSmall(
            title: linkTextType,
            fontWeight: linkFontWeight ?? FontWeight.normal,
            textColor: linkTextColor,
            textDecoration: textDecoration ?? TextDecoration.underline,
            textDecorationColor: textDecorationColor ?? GlobalVariables.blackColor,
          ),
          SizedBox(width: SizeGlobalVariables.double_size_four.w,),
          // iconType
          isIconWidgetRequiredAtEnd ? CustomIcon(
              iconData: iconData ?? Icons.arrow_forward,
              iconColor: iconColor ?? GlobalVariables.buttonColor,
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
