import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  double? iconSize;
  final iconColor;
  CustomIcon({
    required this.iconData,
    this.iconSize,
    required this.iconColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: iconColor,
      size: iconSize ?? SizeGlobalVariables.double_size_eighteen.sp,
    );
  }
}
