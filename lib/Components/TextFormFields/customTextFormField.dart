import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raymond_test/Components/customIcon.dart';

import '../../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';
import '../../GlobalVariables/globalVariables.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController editingController;
  final ValueChanged<String>? onChangeFunction;
  final FormFieldValidator<String>? validatorFunction;
  final VoidCallback? onSuffixIconClickFunction;
  final String? errorText;
  final String hintText;
  final Color? hintTextColor;
  final bool isFieldHeightRequired;
  final double? fieldWidth;
  final int? maxLines;
  final int? minLines;

  const CustomTextFormField({
    required this.obscureText,
    required this.textInputType,
    required this.hintText,
    this.hintTextColor,
    required this.editingController,
    this.onChangeFunction,
    this.errorText,
    this.validatorFunction,
    this.maxLines,
    this.minLines,
    this.fieldWidth,
    required this.isFieldHeightRequired,
    this.onSuffixIconClickFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isFieldHeightRequired
        ? Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeGlobalVariables.double_size_five.h,
      ),
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty.w,
      child: TextFormField(
        minLines: minLines ?? SizeGlobalVariables.integer_size_five,
        maxLines: maxLines ?? SizeGlobalVariables.integer_size_six,
        cursorColor: GlobalVariables.buttonColor,
        controller: editingController,
        onChanged: onChangeFunction,
        style: TextStyle(
          fontSize: SizeGlobalVariables.double_size_fourteen.sp,
          color: GlobalVariables.blackColor,
        ),
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorText: errorText,
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeGlobalVariables.double_size_ten.h, // Adjust vertical padding
            horizontal: SizeGlobalVariables.double_size_ten.w,
          ),
          fillColor: GlobalVariables.textFieldColor.withOpacity(SizeGlobalVariables.zero_point_nine_nine),
          filled: GlobalVariables.trueValue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight.r),
            borderSide: BorderSide(
              color: GlobalVariables.buttonColor.withOpacity(SizeGlobalVariables.point_one),
              width: SizeGlobalVariables.one_point_two.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight.r),
            borderSide: BorderSide(
              color: GlobalVariables.buttonColor,
              width: SizeGlobalVariables.one_point_two.w,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor ?? GlobalVariables.fadedBlackColor.withOpacity(SizeGlobalVariables.point_two_two),
            fontSize: SizeGlobalVariables.double_size_fourteen.sp,
          ),
          suffixIcon: onSuffixIconClickFunction != null
              ? GestureDetector(
            onTap: onSuffixIconClickFunction,
            child: CustomIcon(
              iconData: obscureText ? Icons.visibility : Icons.visibility_off,
              iconColor: GlobalVariables.textFieldDeeperShadeColorThree,
            ),
          )
              : null,
        ),
        validator: validatorFunction,
      ),
    )
        : SizedBox(
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty.w,
      height: SizeGlobalVariables.double_size_forty.h,
      child: TextFormField(
        cursorColor: GlobalVariables.buttonColor,
        controller: editingController,
        obscureText: obscureText,
        onChanged: onChangeFunction,
        style: TextStyle(
          fontSize: SizeGlobalVariables.double_size_fourteen.sp,
          color: GlobalVariables.blackColor,
        ),
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeGlobalVariables.double_size_ten.h, // Adjust vertical padding
            horizontal: SizeGlobalVariables.double_size_ten.w,
          ),
          fillColor: GlobalVariables.textFieldColor.withOpacity(SizeGlobalVariables.zero_point_nine_nine),
          filled: GlobalVariables.trueValue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight.r),
            borderSide: BorderSide(
              color: GlobalVariables.buttonColor.withOpacity(SizeGlobalVariables.point_one),
              width: SizeGlobalVariables.one_point_two.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight.r),
            borderSide: BorderSide(
              color: GlobalVariables.buttonColor,
              width: SizeGlobalVariables.one_point_two.w,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: GlobalVariables.fadedBlackColor.withOpacity(SizeGlobalVariables.zero_point_six_six),
            fontSize: SizeGlobalVariables.double_size_fourteen.sp,
            fontWeight: FontWeight.normal,
          ),
          suffixIcon: onSuffixIconClickFunction != null
              ? GestureDetector(
            onTap: onSuffixIconClickFunction,
            child: CustomIcon(
              iconData: obscureText ? Icons.visibility : Icons.visibility_off,
              iconColor: GlobalVariables.textFieldDeeperShadeColorThree,
            ),
          )
              : null,
        ),
        validator: validatorFunction,
      ),
    );
  }
}
