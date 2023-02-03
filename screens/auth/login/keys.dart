import 'package:flutter/widgets.dart';

class AuthKeys {
  // Form key for login page //
  static final formKeyLogin = GlobalKey<FormState>();
  // formkey for firstTimeLogin//
  static final formKeyFirstTimeGetCode = GlobalKey<FormState>();
  // formkey for firstTimeLogin//
  static final formKeyFirstTimeVerfy = GlobalKey<FormState>();
  // formkey for setPasswordFirstTime//
  static final formKeyFirstTimesetPassword = GlobalKey<FormState>();
  // formkey for forgetPassword sent password//
  static final formKeyForgetPasswordGetCode = GlobalKey<FormState>();
  // formkey for forgetPassword verfy//
  static final formKeyForgetPasswordVerfy = GlobalKey<FormState>();
  // formkey for forgetPassword reset//
  static final formKeyForgetPasswordresetPassword = GlobalKey<FormState>();
}
