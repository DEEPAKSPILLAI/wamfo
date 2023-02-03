import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:wamfo/main.dart';
import 'package:wamfo/models/user.dart';
import 'package:wamfo/screens/island/island.dart';
import 'package:wamfo/utils/messages.dart';

import '../../../base/base_view_model.dart';

class LoginVM extends BaseViewModel {
  @override
  void onInit() {}

// this veriable is used to show pages in first time login //
  int firstTimeLoginPages = 0;
// 0 -> first time login pagae //
// 1 -> verfy page //
// 2 -> confirm pasword //
// 3 -> success page //

// this veriable is used to show forget password page //
  int forgetPasswordPage = 0;
// 0 -> forget password page //
// 1 -> verfyForgetPassword //
// 2 -> resetPassword //
// 3 -> success page //

  final FlipCardController flipCardController = FlipCardController();
  final FlipCardController flipCardControllerForgetPassword =
      FlipCardController();

// login page controllers //
  final TextEditingController studentNuberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
// FirstTime login page controllers //
  final TextEditingController firstTimeEmailController =
      TextEditingController();
  final TextEditingController firstTimeCodeController = TextEditingController();
  final TextEditingController firstTimePasswordController =
      TextEditingController();
  final TextEditingController firstTimeConfirmPasswordController =
      TextEditingController();
  // Forget password page controllers //
  final TextEditingController forgetEmailController = TextEditingController();
  final TextEditingController forgetCodeController = TextEditingController();
  final TextEditingController forgetPasswordController =
      TextEditingController();
  final TextEditingController forgetConfirmPasswordController =
      TextEditingController();

  // Form key for login page //
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  // formkey for firstTimeLogin//
  final GlobalKey<FormState> formKeyFirstTimeGetCode = GlobalKey<FormState>();
  // formkey for firstTimeLogin//
  final GlobalKey<FormState> formKeyFirstTimeVerfy = GlobalKey<FormState>();
  // formkey for setPasswordFirstTime//
  final GlobalKey<FormState> formKeyFirstTimesetPassword =
      GlobalKey<FormState>();
  // formkey for forgetPassword sent password//
  final GlobalKey<FormState> formKeyForgetPasswordGetCode =
      GlobalKey<FormState>();
  // formkey for forgetPassword verfy//
  final GlobalKey<FormState> formKeyForgetPasswordVerfy =
      GlobalKey<FormState>();
  // formkey for forgetPassword reset//
  final GlobalKey<FormState> formKeyForgetPasswordresetPassword =
      GlobalKey<FormState>();
  late Map resGetOtp;
  late Map resVerfyOtp;

  login() async {
    if (formKeyLogin.currentState!.validate()) {
      //TODO login logic and api call//
      showLoading();
      final response = await api.authRepo.login(jsonEncode({
        "user_id": studentNuberController.text,
        "password": passwordController.text
      }));
      hideLoading();

      if (response.data['success'] == true) {
        prefs.token = response.data['data']['token'];
        prefs.user = UserModel.fromJson(response.data['data']['user']);
        if (prefs.user?.isStudent == true) {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              MyApp.context,
              MaterialPageRoute(builder: (_) => const Island()),
              (route) => false);
          studentNuberController.text = "";
          passwordController.text = "";
        } else {
          showError("Only Students can Login");
        }
      } else {
        showError("invalid username or password");
      }
    } else {
      showError(Messages.serverError);
    }
  }

  firstTimeLoginGetCode() async {
    if (formKeyFirstTimeGetCode.currentState!.validate()) {
      //TODO login logic and api call//

      notifyListeners();
      final body = {"email_id": firstTimeEmailController.text};
      showLoading();

      final res = await api.authRepo.getOtp(jsonEncode(body));
      hideLoading();
      if (res.runtimeType == Response) {
        if (res.data['success'] == true) {
          firstTimeLoginPages = 1;
          resGetOtp = res.data;
          print(res);
        } else {
          showError(res.data['data']);
        }
      } else {
        showError(res.data['message']);
      }
    }
  }

  resend() async {
    showLoading();
    final res = await api.authRepo
        .getOtp(jsonEncode({"email_id": firstTimeEmailController.text}));
    if (res.runtimeType == Response) {
      resGetOtp = res.data;
      print(res);
    }
    hideLoading();
  }

  firstTimeLoginVerfyCode() async {
    if (formKeyFirstTimeVerfy.currentState!.validate()) {
      //TODO login logic and api call//

      notifyListeners();
      try {
        showLoading();
        final res = await api.authRepo.verifyOtp(
            jsonEncode({"otp": firstTimeCodeController.text}),
            "/${resGetOtp['data']['submit_url']}");
        hideLoading();
        if (res.data['success'] == true) {
          firstTimeLoginPages = 2;
        } else {
          showError("Wrong OTP");
        }
        resVerfyOtp = res.data;
        firstTimeCodeController.text = "";
        print(res);

        return res.data;
      } catch (_) {
        showError("Time Out Please Resend OTP");
      }
    }
  }

  firstTimeLoginSetupPassword() async {
    if (formKeyFirstTimesetPassword.currentState!.validate() &&
        firstTimeConfirmPasswordController.text ==
            firstTimePasswordController.text) {
      //TODO login logic and api call//
      firstTimeLoginPages = 3;
      notifyListeners();
      showLoading();
      final res = await api.authRepo.changePassword(
          jsonEncode({"password": firstTimePasswordController.text}),
          "/${resVerfyOtp['data']['password_reset_url']}");
      if (res.data['success'] == true) {
        hideLoading();
        return res;
      } else {
        showError("Faild to update password");
      }
    } else {
      showError("Server Error");
    }

    notifyListeners();
  }

// Forget password methods //
  forgetPasswordGetCode() async {
    if (formKeyForgetPasswordGetCode.currentState!.validate()) {
      //TODO login logic and api call//

      final body = {"email_id": forgetEmailController.text};
      showLoading();

      final res = await api.authRepo.getOtp(jsonEncode(body));
      hideLoading();
      if (res.runtimeType == Response) {
        if (res.data['success'] == true) {
          forgetPasswordPage = 1;
          resGetOtp = res.data;

          print(res);
        } else {
          showError(res.data['data']);
        }
      } else {
        showError(res.data['message']);
      }

      notifyListeners();
    }
  }

  resendForgot() async {
    showLoading();
    final res = await api.authRepo
        .getOtp(jsonEncode({"email_id": forgetEmailController.text}));
    if (res.runtimeType == Response) {
      resGetOtp = res.data;
    }
    hideLoading();
  }

  forgetPasswordVerfyCode() async {
    if (formKeyForgetPasswordVerfy.currentState!.validate()) {
      //TODO login logic and api call//

      notifyListeners();
      try {
        showLoading();
        final res = await api.authRepo.verifyOtp(
            jsonEncode({"otp": forgetCodeController.text}),
            "/${resGetOtp['data']['submit_url']}");
        hideLoading();
        if (res.data['success'] == true) {
          forgetPasswordPage = 2;
        } else {
          showError("Wrong OTP");
        }

        resVerfyOtp = res.data;
        forgetCodeController.text = "";

        return res.data;
      } catch (_) {
        showError("Time Out Please Resend OTP");
      }
    }
  }

  forgetPasswordSetupPassword() async {
    if (formKeyForgetPasswordresetPassword.currentState!.validate() &&
        forgetConfirmPasswordController.text == forgetPasswordController.text) {
      //TODO login logic and api call//
      forgetPasswordPage = 3;
      notifyListeners();
      showLoading();
      final res = await api.authRepo.changePassword(
          jsonEncode({"password": forgetPasswordController.text}),
          "/${resVerfyOtp['data']['password_reset_url']}");
      if (res.data['success'] == true) {
        hideLoading();
        return res;
      } else {
        showError("Faild to update password");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }
}
