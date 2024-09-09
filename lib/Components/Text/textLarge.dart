import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';


class TextLarge extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  TextOverflow? overflow;
  final Color textColor;
  double? textSize;
  TextLarge({
    required this.title,
    required this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textSize,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: overflow ?? TextOverflow.visible,
      style: GoogleFonts.inter(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: textSize ?? SizeGlobalVariables.double_size_eighteen.sp,
      ),
    );
  }
}
