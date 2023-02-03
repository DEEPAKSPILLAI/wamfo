import 'dart:ui';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wamfo/components/input/input_field.dart';
import 'package:wamfo/screens/auth/login/login_vm.dart';
import 'package:wamfo/utils/validators.dart';

import '../../../base/base_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key,
  // required this.frontBuilder,
  //   required this.backBuilder,

  }) : super(key: key);
  //   final WidgetBuilder frontBuilder;
  // final WidgetBuilder backBuilder;

  @override
  //  PageFlipBuilderState createState()=> PageFlipBuilderState();
   State<Login> createState() => _LoginState();
}


bool showLogin = false;

class _LoginState extends State<Login> with BasePage<LoginVM> {
 PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;
 
  @override
  void initState() {
    showLosgin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return builder(
      () =>  Scaffold(
        // PageFlipBuilder(
        //   frontBuilder: (_) =>  LightHomePage(
        //             // flipOnTouch: false,
        //             // controller: provider.flipCardController,
        //              frontBuilder: loginFront(),
        //             backBuilder: DarkHomePage(
        //               duration: const Duration(milliseconds: 500),
        //               child: getFirstTimeLogin(),
        //               //  child: Container(),
        //             ),  
        //             // frontBuilder: (_) {  },
        //             // backBuilder: (_) {  },
        //             ),
        //   backBuilder: (_) => AnimatedSwitcher(
        //             duration: const Duration(milliseconds: 500),
        //             // child: Container()
        //             child: getForgetPasswordWidgets(),
                  
        //         ),
        // ),
          resizeToAvoidBottomInset: false,
        // ivide pageview vechathkond no error bt no crt output
        body:PageView(
          scrollDirection: Axis.horizontal,
controller: controller,
// physics: BouncingScrollPhysics(),

          children:[
             Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/auth/bg.png'),
            ),
          ),
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: showLogin ? 1 : 0,
            child: Stack(
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(),
                  ),
                ),
// Container(
//         // add a black background to prevent flickering on Android when the page flips
        
//         child: PageFlipBuilder(
//           frontBuilder: (_) =>  FlipCard(
//                     flipOnTouch: false,
//                     controller: provider.flipCardController,
//                     front: loginFront(),
//                     back: AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 500),
//                       child: getFirstTimeLogin(),
//                       //  child: Container(),
//                     ),),
//           backBuilder: (_) => AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 500),
//                     // child: Container()
//                     child: getForgetPasswordWidgets(),                 
//                 ),
//         ),),
                // FlipCard(
                //   flipOnTouch: false,
                //   controller: provider.flipCardControllerForgetPassword,
                //   front: FlipCard(
                //     flipOnTouch: false,
                //     controller: provider.flipCardController,
                //     front: loginFront(),
                //     back: AnimatedSwitcher(
                //       duration: const Duration(milliseconds: 500),
                //       child: getFirstTimeLogin(),
                //         // child: Container(),
                //     ),
                //   ),
                //   back: AnimatedSwitcher(
                //     duration: const Duration(milliseconds: 500),
                //     // child: Container()
                //     child: getForgetPasswordWidgets(),
                //   ),
                // ),
              ],
            ),
          ),
        ),

        Container(
          
         child: PageFlipBuilder(
          frontBuilder: (_) =>  FlipCard(
                    // flipOnTouch: true,
                    // controller: provider.flipCardController,
                    front: loginFront(),
                    back: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: getFirstTimeLogin(),
                      //  child: Container(),
                    ),),
          backBuilder: (_) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    // child: Container()
                    child: getForgetPasswordWidgets(),
                  
                ),
        ),
        ),         


        
        ],
        ),
        

      ),
    );
  }

// background to login animation //
  showLosgin() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(
      () {
        showLogin = true;
      },
    );
  }

  getFirstTimeLogin() {
    switch (provider.firstTimeLoginPages) {
      case 0:
        return firstTimeLogin();
      case 1:
        return verfy();
      case 2:
        return passwordconfirm();
      case 3:
        return success();
      default:
        return firstTimeLogin();
    }
  }

  getForgetPasswordWidgets() {
    switch (provider.forgetPasswordPage) {
      case 0:
        return forgetPassword();
      case 1:
        return verfyForgetPassword();
      case 2:
        return resetPassword();
      case 3:
        return successReset();
      default:
        return forgetPassword();
    }
  }

// login Front page //
  Widget loginFront() {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "Please login to continue",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 42),
               InputField(
                    validation:Validators.basic,
                   
                  controller:provider.studentNuberController,
                 prefixIcon: SvgPicture.asset('assets/auth/user.svg',
                     height: 20, width: 20, fit: BoxFit.scaleDown),
                 hintText: "Student Email",
              ),
              const SizedBox(height: 42),
              InputField(
                 prefixIcon: Image.asset('assets/auth/password.png'),
                hintText: "Password",
                   validation: Validators.basic,
                 controller: provider.passwordController,
                   obscureText: true,

                 


                suffixIcon: TextButton(
                  onPressed: () {
                     provider.flipCardControllerForgetPassword.toggleCard();
                  },
                  child: Text(
                    "Forgot?",
                    style: TextStyle(color: provider.prop.primaryColor),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 49,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 84,
                  child: ElevatedButton(
                    onPressed: () {
                       provider.login();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: provider.prop.primaryColor,
                      shadowColor: Colors.grey,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 49,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                      provider.flipCardController.toggleCard();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'First time login',
                    style: TextStyle(color: provider.prop.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// First time login get code widgets //
  Widget firstTimeLogin() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyFirstTimeGetCode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "First time login",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "Please enter your student email",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 14),
              InputField(
                validation: Validators.email,
                controller: provider.firstTimeEmailController,
                prefixIcon: Image.asset('assets/auth/email.png',
                    height: 20, width: 20, fit: BoxFit.scaleDown),
                hintText: "Student Email",
              ),
              const SizedBox(height: 25),
              const Text(
                "We will send your verification code to your email.",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 49,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 84,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.firstTimeLoginGetCode();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: provider.prop.primaryColor,
                      shadowColor: Colors.grey,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 49,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.firstTimeCodeController.text = "";
                     provider.firstTimeEmailController.text = "";
                     provider.forgetEmailController.text = "";
                     provider.forgetCodeController.text = "";
                     provider.studentNuberController.text = "";
                     provider.passwordController.text = "";

                       provider.flipCardController.toggleCard();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Back to Login page',
                    style: TextStyle(color: provider.prop.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget verfy() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyFirstTimeVerfy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verifying",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "We’ve sent your verification code to your email.",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 42),
              InputField(
                textInputType: TextInputType.number,
                validation: Validators.basic,
                controller: provider.firstTimeCodeController,
                prefixIcon: SvgPicture.asset('assets/auth/edit.svg',
                    height: 20, width: 20, fit: BoxFit.scaleDown),
                hintText: "Enter your code",
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        provider.resend();
                      },
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                          color: provider.prop.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 49,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 84,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.firstTimeLoginVerfyCode();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: provider.prop.primaryColor,
                          shadowColor: Colors.grey,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Verify'),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 49,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.firstTimeCodeController.text = "";
                    provider.firstTimeEmailController.text = "";
                    provider.forgetEmailController.text = "";
                    provider.forgetCodeController.text = "";
                    provider.studentNuberController.text = "";
                    provider.passwordController.text = "";
                    provider.flipCardController.toggleCard();
                    setState(() {
                      provider.firstTimeLoginPages = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Back to Login page',
                    style: TextStyle(color: provider.prop.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordconfirm() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyFirstTimesetPassword,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "First time login",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "Please set up your password.",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 42),
              InputField(
                validation: Validators.basic,
                controller: provider.firstTimePasswordController,
                prefixIcon: Image.asset('assets/auth/password.png'),
                hintText: "Your password",
                obscureText: true,
              ),
              const SizedBox(height: 42),
              InputField(
                validation: Validators.basic,
                controller: provider.firstTimeConfirmPasswordController,
                prefixIcon: Image.asset('assets/auth/password.png'),
                hintText: "Enter your password again",
                obscureText: true,
              ),
              Row(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: provider.firstTimePasswordController.text !=
                          provider.firstTimeConfirmPasswordController.text,
                      child: const Text(
                        "Passwords do not match.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 49,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 84,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.firstTimeLoginSetupPassword();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: provider.prop.primaryColor,
                          shadowColor: Colors.grey,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Confirmn'),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget success() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            const Text(
              "Set your account successfully!!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, color: Colors.black),
            ),
            const SizedBox(height: 42),
            Container(
              height: 49,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.flipCardController.toggleCard();
                  setState(() {
                    provider.firstTimeCodeController.text = "";
                    provider.firstTimeEmailController.text = "";
                    provider.forgetEmailController.text = "";
                    provider.forgetCodeController.text = "";
                    provider.studentNuberController.text = "";
                    provider.passwordController.text = "";
                    provider.firstTimeLoginPages = 0;
                    provider.firstTimeConfirmPasswordController.text = "";
                    provider.firstTimePasswordController.text = "";
                    provider.forgetConfirmPasswordController.text = "";
                    provider.forgetPasswordController.text = "";
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.grey,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Back to Login page',
                  style: TextStyle(color: provider.prop.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
// End of first time login Widgets //

// forget password widgets //
  Widget forgetPassword() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyForgetPasswordGetCode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "Please enter your student email",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 42),
              InputField(
                validation: Validators.email,
                controller: provider.forgetEmailController,
                prefixIcon: Image.asset('assets/auth/email.png',
                    height: 20, width: 20, fit: BoxFit.scaleDown),
                hintText: "Student email",
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 49,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 84,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.forgetPasswordGetCode();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: provider.prop.primaryColor,
                      shadowColor: Colors.grey,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 49,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.firstTimeCodeController.text = "";
                    provider.firstTimeEmailController.text = "";
                    provider.forgetEmailController.text = "";
                    provider.forgetCodeController.text = "";
                    provider.studentNuberController.text = "";
                    provider.passwordController.text = "";
                    provider.flipCardControllerForgetPassword.toggleCard();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Back to Login page',
                    style: TextStyle(color: provider.prop.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget verfyForgetPassword() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyForgetPasswordVerfy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verifying",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "We’ve sent your verification code to your email.",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 42),
              InputField(
                textInputType: TextInputType.number,
                validation: Validators.basic,
                controller: provider.forgetCodeController,
                prefixIcon: SvgPicture.asset('assets/auth/edit.svg',
                    height: 20, width: 20, fit: BoxFit.scaleDown),
                hintText: "Enter your code",
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        provider.resendForgot();
                      },
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                          color: provider.prop.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 49,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 84,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.forgetPasswordVerfyCode();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: provider.prop.primaryColor,
                          shadowColor: Colors.grey,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Verify'),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 49,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.firstTimeCodeController.text = "";
                    provider.firstTimeEmailController.text = "";
                    provider.forgetEmailController.text = "";
                    provider.forgetCodeController.text = "";
                    provider.studentNuberController.text = "";
                    provider.passwordController.text = "";
                    provider.flipCardControllerForgetPassword.toggleCard();
                    setState(() {
                      provider.forgetPasswordPage = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.grey,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Back to Login page',
                    style: TextStyle(color: provider.prop.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget resetPassword() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Form(
          key: provider.formKeyForgetPasswordresetPassword,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 36),
              ),
              const Text(
                "Please enter your password.",
                style: TextStyle(fontSize: 18, color: Color(0xffAFAFAF)),
              ),
              const SizedBox(height: 42),
              InputField(
                validation: Validators.basic,
                controller: provider.forgetPasswordController,
                prefixIcon: Image.asset('assets/auth/password.png'),
                hintText: "Your password",
                obscureText: true,
              ),
              const SizedBox(height: 42),
              InputField(
                validation: Validators.basic,
                controller: provider.forgetConfirmPasswordController,
                prefixIcon: Image.asset('assets/auth/password.png'),
                hintText: "Enter your password again",
                obscureText: true,
              ),
              Row(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: provider.forgetConfirmPasswordController.text !=
                          provider.forgetPasswordController.text,
                      child: const Text(
                        "Passwords do not match.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 49,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 84,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.forgetPasswordSetupPassword();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: provider.prop.primaryColor,
                          shadowColor: Colors.grey,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Confirm'),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget successReset() {
    return Center(
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 67, 33, 34),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            const Text(
              "Reset Password successfully!!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, color: Colors.black),
            ),
            const SizedBox(height: 42),
            Container(
              height: 49,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.firstTimeCodeController.text = "";
                  provider.firstTimeEmailController.text = "";
                  provider.forgetEmailController.text = "";
                  provider.forgetCodeController.text = "";
                  provider.studentNuberController.text = "";
                  provider.passwordController.text = "";
                  provider.flipCardControllerForgetPassword.toggleCard();
                  provider.firstTimeConfirmPasswordController.text = "";
                  provider.firstTimePasswordController.text = "";
                  provider.forgetConfirmPasswordController.text = "";
                  provider.forgetPasswordController.text = "";
                  setState(() {
                    provider.forgetPasswordPage = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.grey,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Back to Login page',
                  style: TextStyle(color: provider.prop.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// End forget password widgets //
  @override
  LoginVM create() => LoginVM();

  @override
  void initialise(BuildContext context) {}
  
  PageFlipBuilder({required FlipCard Function(dynamic _) frontBuilder, required AnimatedSwitcher Function(dynamic _) backBuilder}) {}
  
  LightHomePage({required Widget frontBuilder, required backBuilder}) {}
  
  DarkHomePage({required Duration duration, required child}) {}
}
