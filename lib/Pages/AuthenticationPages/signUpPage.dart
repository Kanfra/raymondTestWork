import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Components/Links/links.dart';
import '../../Components/Text/textExtraSmall.dart';
import '../../Components/Text/textLarge.dart';
import '../../Components/Text/textMedium.dart';
import '../../Components/Text/textSmall.dart';
import '../../Components/TextFormFields/customTextFormField.dart';
import '../../Components/customTextButton.dart';
import '../../GlobalVariables/ImageStringGlobalVariables/imageStringGlobalVariables.dart';
import '../../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';
import '../../GlobalVariables/globalVariables.dart';
import '../../Routes/routeClass.dart';
import '../../Services/authenticationService.dart';
import '../../Utils/utils.dart';
import '../../Validators/inputValidators.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final AuthenticationService _authenticationService = AuthenticationService();


  // overridables
  String _snackBarMessageStatus = '';
  String _signupButtonTextStatus = 'Sign up';
  bool _isLoading = GlobalVariables.falseValue;
  bool _obscureText = GlobalVariables.trueValue;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  NameInput _name = const NameInput.pure();
  EmailInput _email = const EmailInput.pure();
  PasswordInput _password = const PasswordInput.pure();

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  //
  void waitAmomentFunction(){
    setState(() {
      _isLoading = GlobalVariables.trueValue;
      _signupButtonTextStatus = "Wait a moment";
    });
    showSnackBar(
      context: context,
      message: 'Wait a moment',
      messageFontWeight: FontWeight.w500,
      messageColor: GlobalVariables.whiteColor,
      snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
    );
  }
  void accountExistFunction(){
    setState(() {
      _signupButtonTextStatus = "Sign up";
      _isLoading = GlobalVariables.falseValue;
    });
    // User already exists
    showSnackBar(
        context: context,
        message: "An account with this email already exists",
        messageFontWeight: FontWeight.w500,
        messageColor: GlobalVariables.whiteColor,
        snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
    );
  }


  void successfulSignUpFunction(){
    setState(() {
      _signupButtonTextStatus = "Sign up Successful";
      _isLoading = GlobalVariables.falseValue;
    });
    // show success first
    showSnackBar(
        context: context,
        message: 'Sign up successful',
        messageFontWeight: FontWeight.w500,
        messageColor: GlobalVariables.whiteColor,
        snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
    );
  }

  void unsuccessfulSignUpFunction(){
    setState(() {
      _signupButtonTextStatus = "Sign up";
      _isLoading = GlobalVariables.falseValue;
    });
    // sign up failed
    showSnackBar(
      context: context,
      message: 'Sign up failed',
      messageFontWeight: FontWeight.w500,
      messageColor: GlobalVariables.whiteColor,
      snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
    );
  }
  void dioExceptionFunction(){
    setState(() {
      _signupButtonTextStatus = "Sign up";
      _isLoading = GlobalVariables.falseValue;
    });
    showSnackBar(
      context: context,
      message: 'Network error: Check your internet connection',
      messageFontWeight: FontWeight.w500,
      messageColor: GlobalVariables.whiteColor,
      snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
    );
  }



  void _onNameChanged(String value) {
    setState(() {
      _name = NameInput.dirty(value);
      _validateForm();
    });
  }

  void _onEmailChanged(String value) {
    setState(() {
      _email = EmailInput.dirty(value);
      _validateForm();
    });
  }

  void _onPasswordChanged(String value) {
    setState(() {
      _password = PasswordInput.dirty(value);
      _validateForm();
    });
  }

  void _validateForm() {
    setState(() {
      _nameError = _name.error != null ? 'Please enter a valid name' : null;
      _emailError = _email.error != null ? 'Please enter a valid email' : null;
      _passwordError = _password.error != null ? 'Password must be at least 8 characters long' : null;
    });
  }



  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: GlobalVariables.buttonColor,
            image: DecorationImage(
              image: const AssetImage(
                "${ImageStringGlobalVariables.imagePath}${ImageStringGlobalVariables.signUpBackgroundImage}",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                GlobalVariables.buttonColor.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 100.h,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: TextLarge(
                    title: "TestMe",
                    fontWeight: FontWeight.bold,
                    textColor: GlobalVariables.whiteColor,
                  ),
                ),
              ),
              Positioned(
                bottom: SizeGlobalVariables.zero.h,
                left: SizeGlobalVariables.zero.w,
                right: SizeGlobalVariables.zero.w,
                child: Container(
                  padding: EdgeInsets.only(
                    top: SizeGlobalVariables.double_size_thirty.h,
                    bottom: SizeGlobalVariables.double_size_fifty.h,
                    left: SizeGlobalVariables.double_size_fifteen.w,
                    right: SizeGlobalVariables.double_size_fifteen.w,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: GlobalVariables.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeGlobalVariables.double_size_fifteen.r),
                      topRight: Radius.circular(SizeGlobalVariables.double_size_fifteen.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: TextMedium(
                          title: "Get started for free.",
                          fontWeight: FontWeight.w500,
                          textColor: GlobalVariables.blackColor,
                        ),
                      ),
                      SizedBox(height: SizeGlobalVariables.double_size_ten.h,),
                      Center(
                        child: TextExtraSmall(
                          title: "Free forever. No credit card needed.",
                          fontWeight: FontWeight.normal,
                          textColor: GlobalVariables.fadedBlackColor,
                        ),
                      ),
                      SizedBox(height: SizeGlobalVariables.double_size_thirty.h,),
                      CustomTextFormField(
                        textInputType: TextInputType.name,
                        hintText: "Enter your name",
                        editingController: _nameController,
                        obscureText: GlobalVariables.falseValue,
                        fieldWidth: double.infinity,
                        isFieldHeightRequired: GlobalVariables.falseValue,
                        errorText: _nameError, // Pass the error text
                        onChangeFunction: _onNameChanged,
                      ),
                      SizedBox(height: SizeGlobalVariables.double_size_fifteen.h,),
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: "Enter your email",
                        editingController: _emailController,
                        obscureText: GlobalVariables.falseValue,
                        fieldWidth: double.infinity,
                        isFieldHeightRequired: GlobalVariables.falseValue,
                        errorText: _emailError, // Pass the error text
                        onChangeFunction: _onEmailChanged,
                      ),
                      SizedBox(height: SizeGlobalVariables.double_size_fifteen.h,),
                      CustomTextFormField(
                        textInputType: TextInputType.visiblePassword,
                        hintText: "Enter your password",
                        editingController: _passwordController,
                        fieldWidth: double.infinity,
                        obscureText: _obscureText,
                        isFieldHeightRequired: GlobalVariables.falseValue,
                        errorText: _passwordError, // Pass the error text
                        onChangeFunction: _onPasswordChanged,
                        onSuffixIconClickFunction: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      SizedBox(height: SizeGlobalVariables.double_size_twenty_four.h,),
                      // submit button
                      CustomTextButton(
                        buttonTextType: _signupButtonTextStatus,
                        textTypeColor: GlobalVariables.whiteColor,
                        isFullButtonWidthRequired: GlobalVariables.trueValue,
                        isLoading: _isLoading,
                        buttonBackgroundColor: GlobalVariables.buttonColor,
                        onClickFunction: _isLoading ? (){
                          // wait a moment snackbar
                          showSnackBar(
                              context: context,
                              message: "Wait a moment",
                              messageFontWeight: FontWeight.w500,
                              messageColor: GlobalVariables.whiteColor,
                              snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
                          );
                        } : () {
                          _validateForm(); // Validate on submit
                          if (_nameError == null && _emailError == null && _passwordError == null) {
                            // make signup api call
                            _authenticationService.signUp(
                              context: context,
                              id: '',
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              waitAmomentFunction: waitAmomentFunction,
                              accountExistFunction: accountExistFunction,
                              successfulSignUpFunction: successfulSignUpFunction,
                              unsuccessfulSignUpFunction: unsuccessfulSignUpFunction,
                              dioExceptionFunction: dioExceptionFunction,
                            );

                          } else {
                            // Combine all error messages
                            String errorMessage = 'Incorrect input fields';
                            setState(() {
                              _snackBarMessageStatus = errorMessage;
                            });
                            // snackbar display
                            showSnackBar(
                              context: context,
                              message: _snackBarMessageStatus,
                              messageFontWeight: FontWeight.w500,
                              messageColor: GlobalVariables.whiteColor,
                              snackBarBackgroundColor: GlobalVariables.redColor,
                            );
                          }
                        },
                      ),
                      SizedBox(height: SizeGlobalVariables.double_size_fifteen.h,),
                      // Row for don't have an account and sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // don't have an account text
                          TextSmall(
                            title: "Already have an account?",
                            textColor: GlobalVariables.textFieldDeeperShadeColorThree,
                            fontWeight: FontWeight.normal,
                          ),
                          SizedBox(width: SizeGlobalVariables.double_size_four.w,),
                          // links for sign up
                          Links(
                              linkTextType: 'Sign in',
                              linkTextColor: GlobalVariables.buttonColor,
                              isTextSmall: GlobalVariables.trueValue,
                              linkFontWeight: FontWeight.w500,
                              isIconWidgetRequiredAtEnd: GlobalVariables.falseValue,
                              isIconWidgetRequiredAtFront: GlobalVariables.falseValue,
                              textDecorationColor: GlobalVariables.buttonColor,
                              onClickFunction: (){
                                Get.offNamed(RouteClass.signInPage);
                              }
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
