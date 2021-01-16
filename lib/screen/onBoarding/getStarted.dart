import 'package:anbyshop/screen/security/loginScreen.dart';
import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/util/outlineButton.dart';
import 'package:anbyshop/util/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const blue = CustomColors.PrimaryColor;
const kTitleStyle = TextStyle(
    fontSize: 28, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 16, color: Color(0xFF88869f));

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  TextEditingController _phoneNumberControllder = new TextEditingController();
  TextEditingController _verifyControllder = new TextEditingController();

  String phoneNumber;

  @override
  void initState() {
    _phoneNumberControllder.addListener(() {
      setState(() {
        phoneNumber = _phoneNumberControllder.value.text;
      });
    });

    super.initState();

    // KeyboardVisibilityNotification().addNewListener(
    //   onChange: (bool visible) {
    //     setState(() {
    //       _keyboardVisible = visible;
    //       print("Keyboard State Changed : $visible");
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = new AuthService();

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _verifyOtp() {
      authService
          .login(_phoneNumberControllder.text, _verifyControllder.text)
          .then((value) => {
                if (value)
                  {
                    Get.snackbar("Success", "You have successfully loggedIn.",
                        backgroundColor: Colors.white),
                  }
                else
                  {
                    Get.snackbar("Error", "Unable to verify.",
                        backgroundColor: Colors.white)
                  }
              });
    }

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          margin: EdgeInsets.only(
                            top: 0,
                          ),
                          child: Text(
                            "Shop Now",
                            style: TextStyle(
                                color: _headingColor,
                                fontFamily: "Nunito-Bold",
                                fontSize: 28),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            "Login to Anbyshop and start shopping also get your first order deliver for free.",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: _headingColor, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Center(
                    child: Image.asset("assets/images/vector-creator.png"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),

        // AnimatedContainer(s
        //   width: _loginWidth,
        //   height: _loginHeight,
        //   curve: Curves.fastLinearToSlowEaseIn,
        //   duration: Duration(milliseconds: 100),
        //   transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
        //   decoration: BoxDecoration(
        //     color: Colors.white.withOpacity(_loginOpacity),
        //   ),
        //   child: Container(
        //     decoration: new BoxDecoration(
        //         gradient: new LinearGradient(
        //             colors: [
        //               Colors.black,
        //               Colors.grey,
        //             ],
        //             stops: [
        //               0.0,
        //               1.0
        //             ],
        //             begin: FractionalOffset.topCenter,
        //             end: FractionalOffset.bottomCenter,
        //             tileMode: TileMode.repeated),
        //         image: DecorationImage(
        //             image: AssetImage("assets/images/secure.png"))),
        //     child: Container(
        //       padding: EdgeInsets.all(16),
        //       margin: EdgeInsets.symmetric(horizontal: 8),
        //       decoration: BoxDecoration(color: Colors.white),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: <Widget>[
        //           Column(
        //             children: <Widget>[
        //               Container(
        //                 width: windowWidth,
        //                 margin: EdgeInsets.only(bottom: 5),
        //                 child: Text(
        //                   "Login To Continue",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                       fontSize: 28, fontFamily: "Nunito-Bold"),
        //                 ),
        //               ),
        //               Container(
        //                 margin: EdgeInsets.only(bottom: 10),
        //                 width: windowWidth,
        //                 child: Text(
        //                   "An otp will be sent to the registered mobile number.",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(fontSize: 14, fontFamily: "Nunito"),
        //                 ),
        //               ),
        //               CustomInputWithIcon(
        //                 controller: _phoneNumberControllder,
        //                 icon: Icons.phone,
        //                 hint: "Enter Phone...",
        //                 isPassword: false,
        //                 type: TextInputType.phone,
        //               ),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 50,
        //           ),
        //           Column(
        //             children: <Widget>[
        //               GestureDetector(
        //                 onTap: () {
        //                   if (_phoneNumberControllder.text.isNotEmpty) {
        //                     String mobilePattern =
        //                         r'(^(?:[+0]9)?[0-9]{10,12}$)';
        //                     RegExp regExp = new RegExp(mobilePattern);
        //                     if (!regExp
        //                         .hasMatch(_phoneNumberControllder.text)) {
        //                       Get.snackbar(
        //                           "Error", "Please enter a valid phone number");
        //                     } else {
        //                       _sendOTP();
        //                     }
        //                   } else {
        //                     Get.snackbar(
        //                         "Error", "Please enter a valid phone number");
        //                   }
        //                 },
        //                 child: isLoading
        //                     ? CircularProgressIndicator()
        //                     : CustomPrimaryButton(
        //                         btnText: "Send OTP",
        //                       ),
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // AnimatedContainer(
        //   height: _registerHeight,
        //   padding: EdgeInsets.all(32),
        //   curve: Curves.fastLinearToSlowEaseIn,
        //   duration: Duration(milliseconds: 1000),
        //   transform: Matrix4.translationValues(0, _registerYOffset, 1),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Column(
        //         children: <Widget>[
        //           Container(
        //             margin: EdgeInsets.only(bottom: 20),
        //             child: Text(
        //               "Verify OTP",
        //               style: TextStyle(fontSize: 20),
        //             ),
        //           ),
        //           CustomInputWithIcon(
        //             controller: _verifyControllder,
        //             icon: Icons.code,
        //             hint: "Enter OTP...",
        //             isPassword: false,
        //             type: TextInputType.number,
        //           ),
        //           SizedBox(
        //             height: 20,
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: <Widget>[
        //           GestureDetector(
        //             onTap: () {
        //               _verifyOtp();
        //             },
        //             child: CustomPrimaryButton(
        //               btnText: "Verify OTP",
        //             ),
        //           ),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 _pageState = 1;
        //               });
        //             },
        //             child: CustomOutlineButton(
        //               btnText: "Back To Login",
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
