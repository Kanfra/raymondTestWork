import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:raymond_test/Models/userModel.dart';
import 'package:raymond_test/Utils/utils.dart';

import '../DioClient/dioClient.dart';
import '../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';
import '../GlobalVariables/globalVariables.dart';
import '../Routes/routeClass.dart';

class AuthenticationService {
  final DioClient _dioClient = DioClient();

  // api calls for signup
  Future<void> signUp({
    required BuildContext context,
    required String id,
    required String name,
    required String email,
    required String password,
    required Function waitAmomentFunction,
    required Function accountExistFunction,
    required Function successfulSignUpFunction,
    required Function unsuccessfulSignUpFunction,
    required Function dioExceptionFunction,
  }) async {
    try {
      // showSnackbar for wait a moment
      waitAmomentFunction();
      final UserModel userModel = UserModel(
          id: '',
          name: name,
          email: email,
          password: password
      );
      // First, check if the user already exists
      final existingUsersResponse = await _dioClient.client.get('/users');
      if (existingUsersResponse.statusCode == SizeGlobalVariables.integer_size_two_hundred) {
        final List users = existingUsersResponse.data;

        // Check if the email is already in use
        final existingUser = users.firstWhere(
              (user) => user['email'] == userModel.email,
          orElse: () => null,
        );

        if (existingUser != null) {
          accountExistFunction();
          return;  // Stop further execution
        }
      }

      // If user doesn't exist, proceed with sign-up
      final response = await _dioClient.client.post(
        '/users',
        data: jsonEncode(userModel.toJson()),
      );

      if (response.statusCode == SizeGlobalVariables.integer_size_two_hundred_one) {
        successfulSignUpFunction();

        //Navigate to the login screen on successful signup
        Get.toNamed(RouteClass.signInPage);

      } else {
        unsuccessfulSignUpFunction();
      }
    } on DioException {
      dioExceptionFunction();
    } catch (e) {
      showSnackBar(
        context: context,
        message: 'Error: ${e.toString()}',
        messageFontWeight: FontWeight.w500,
        messageColor: GlobalVariables.whiteColor,
        snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
      );
    }
  }


// API call for sign in
  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
    required Function waitAmomentFunction,
    required Function successfulSignInFunction,
    required Function invalidCredentialsFunction,
    required Function unsuccessfulAuthentication,
    required Function dioExceptionFunction,
  }) async {
    try {
      final UserModel userModel = UserModel(
          id: '',
          name: '',
          email: email,
          password: password
      );
      // Show a message while waiting
      waitAmomentFunction();
      // Make a request to fetch the list of users
      final response = await _dioClient.client.get('/users');

      if (response.statusCode == SizeGlobalVariables.integer_size_two_hundred) {
        final List users = response.data;

        // Check if the email and password match any user
        final existingUser = users.firstWhere(
              (user) => user['email'] == userModel.email && user['password'] == userModel.password,
          orElse: () => null,
        );

        if (existingUser != null) {
          // Sign in successful message
          successfulSignInFunction();

        } else {
          // Invalid credentials
          invalidCredentialsFunction();
        }
      } else {
        // Handle unsuccessful response from the API
        unsuccessfulAuthentication();
      }
    } on DioException {
      // Dio error
      dioExceptionFunction();
    } catch (e) {
      // General error handling
      showSnackBar(
        context: context,
        message: 'Error: ${e.toString()}',
        messageFontWeight: FontWeight.w500,
        messageColor: GlobalVariables.whiteColor,
        snackBarBackgroundColor: GlobalVariables.fadedBlackColor,
      );
    }
  }


}
