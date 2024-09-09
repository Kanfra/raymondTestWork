import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';

class TextSmall extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final Color textColor;
  final double? textSize;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;

  const TextSmall({
    required this.title,
    required this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textSize,
    this.textAlign,
    this.textDecoration,
    this.textDecorationColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: overflow ?? TextOverflow.visible,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.inter(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: textSize ?? SizeGlobalVariables.double_size_fourteen.sp,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textDecorationColor ?? Colors.transparent,

      ),
    );
  }
}
