
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:raymond_test/Pages/HomePages/homePage.dart';
import 'package:raymond_test/Pages/HomePages/networkErrorPage.dart';

import '../Pages/AuthenticationPages/signInPage.dart';
import '../Pages/AuthenticationPages/signUpPage.dart';
import '../Pages/HomePages/statusCheckerPage.dart';


class RouteClass{
  static String signUpPage = "/signUpPage";
  static String signInPage = "/signInPage";
  static String homePage = "/homePage";
  static String statusCheckerPage = "/statusCheckerPage";
  static String networkErrorPage = "/networkErrorPage";

  static String getSignUpPageRoute()=>signUpPage;
  static String getSignInPageRoute()=>signInPage;
  static String getHomePageRoute()=>homePage;
  static String getStatusCheckerPageRoute()=>statusCheckerPage;
  static String getNetworkErrorPageRoute()=>networkErrorPage;


  static List<GetPage> routes = [
    GetPage(page: ()=>const SignUpPage(), name: signUpPage, transition: Transition.leftToRight, transitionDuration: const Duration(milliseconds: 350),),
    GetPage(page: ()=>const SignInPage(), name: signInPage, transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 350),),
    GetPage(page: ()=>const HomePage(), name: homePage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    GetPage(page: ()=>const StatusCheckerPage(), name: statusCheckerPage, transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 350),),
    GetPage(page: ()=>const NetworkErrorPage(), name: networkErrorPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),)
  ];
}