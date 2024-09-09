import 'package:flutter/material.dart';

import '../Components/Text/textSmall.dart';
import '../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required FontWeight messageFontWeight,
  required Color messageColor,
  required Color snackBarBackgroundColor,
  int? snackBarAppearanceDurationInSeconds,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: TextSmall(
        title: message,
        fontWeight: messageFontWeight,
        textColor: messageColor,
      ),
      backgroundColor: snackBarBackgroundColor,
      duration: Duration(seconds: snackBarAppearanceDurationInSeconds ?? SizeGlobalVariables.integer_size_two),
    ),
  );
}