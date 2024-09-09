import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:raymond_test/Components/Text/textSmall.dart';
import 'package:raymond_test/Components/customTextButton.dart';
import 'package:raymond_test/GlobalVariables/ImageStringGlobalVariables/imageStringGlobalVariables.dart';
import 'package:raymond_test/GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';

import '../../GlobalVariables/globalVariables.dart';
import '../../Routes/routeClass.dart';

class NetworkErrorPage extends StatefulWidget {
  const NetworkErrorPage({super.key});

  @override
  State<NetworkErrorPage> createState() => _NetworkErrorPageState();
}

class _NetworkErrorPageState extends State<NetworkErrorPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                    "${ImageStringGlobalVariables.lottiePath}${ImageStringGlobalVariables.networkErrorLottie}",
                    width: 250,
                    height: 250,

                ),
                SizedBox(height: SizeGlobalVariables.double_size_eight.h,),
                // error text
                TextSmall(
                    title: "Check your internet connection",
                    fontWeight: FontWeight.w500,
                    textColor: GlobalVariables.fadedBlackColor,
                ),
                SizedBox(height: SizeGlobalVariables.double_size_eight.h,),
                // reload button
                CustomTextButton(
                    buttonTextType: "Reload",
                    textTypeColor: GlobalVariables.buttonColor,
                    isFullButtonWidthRequired: GlobalVariables.falseValue,
                    isLoading: GlobalVariables.falseValue,
                    buttonBackgroundColor: Colors.transparent,
                    borderThickness: SizeGlobalVariables.one_point_two.w,
                    borderColor: GlobalVariables.buttonColor,
                    onClickFunction: (){
                      Get.offNamed(RouteClass.statusCheckerPage);
                    },
                ),
              ],
            ),
          ),
      ),
    );
  }
}
