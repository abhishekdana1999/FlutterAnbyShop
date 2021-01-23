import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/util/keyboard.dart';
import 'package:anbyshop/util/size_config.dart';

import 'package:anbyshop/widgets/BaseWidgets/AnbyPrimaryButton.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AuthService authService = new AuthService(); // AuthService
  TextEditingController _phoneNumberControllder =
      new TextEditingController(); // For Getting Phonenumber Value
  TextEditingController _verifyControllder =
      new TextEditingController(); // For Getting OTP Value

  AnimationController expandController;
  Animation<double> animation;

  bool isLoading = false; // For Showing Loading Controller
  bool isOtpSent = false; // To Check If OTP is Sent

  _sendOTP() {
    KeyboardUtil.hideKeyboard(context);
    setState(() {
      isLoading = true;
    });
    authService.sendOTP(_phoneNumberControllder.text).then((value) => {
          if (value == true)
            {
              setState(() {
                isLoading = false;
                isOtpSent = true;
              }),
            }
          else
            {
              setState(() {
                isLoading = false;
              }),
              Get.snackbar("Error", "Unable to send OTP.",
                  backgroundColor: Colors.white)
            }
        });
  }

  _verifyOtp() {
    KeyboardUtil.hideKeyboard(context);
    setState(() {
      isLoading = true;
    });
    authService
        .login(_phoneNumberControllder.text, _verifyControllder.text)
        .then((value) => {
              if (value)
                {
                  setState(() {
                    isLoading = false;
                  }),
                  Get.to(HomeScreen()),
                  Get.snackbar("Success", "You have successfully loggedIn.",
                      backgroundColor: Colors.white),
                }
              else
                {
                  setState(() {
                    isLoading = false;
                  }),
                  Get.snackbar("Error", "Invalid OTP.",
                      backgroundColor: Colors.white)
                }
            });
  }

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.elasticIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    var windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: AnbySize.basePadding * 1.5,
          vertical: AnbySize.basePadding * 1.5),
      decoration: BoxDecoration(
        color: Color(0xFFBF6F6F6),
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.multiply),
            image: AssetImage("assets/images/login1.png"),
            fit: BoxFit.cover),
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedCrossFade(
            firstChild: Container(
              padding: EdgeInsets.only(
                  left: AnbySize.basePadding * 2,
                  right: AnbySize.basePadding * 2,
                  top: AnbySize.basePadding * 5,
                  bottom: AnbySize.basePadding * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AnbySize.baseSize / 2),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: windowWidth,
                          margin: EdgeInsets.only(bottom: AnbySize.baseMargin),
                          child: Text(
                            "Login / SignUp",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: AnbySize.headingFontSize,
                                fontFamily: AnbyfontFamily.anbyFontBold),
                          ),
                        ),
                        SizedBox(height: AnbySize.baseSize * 3),
                        CustomInputWithIcon(
                            disable: false,
                            controller: _phoneNumberControllder,
                            icon: Icons.phone,
                            hint: "Enter Phone...",
                            isPassword: false,
                            type: TextInputType.phone,
                            maxLength: 10,
                            fontSize: AnbySize.baseFontSize * 2,
                            suffix: null),
                      ],
                    ),
                    SizedBox(height: AnbySize.baseSize * 2),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              if (_phoneNumberControllder.text.isNotEmpty) {
                                String mobilePattern =
                                    r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = new RegExp(mobilePattern);
                                if (!regExp
                                    .hasMatch(_phoneNumberControllder.text)) {
                                  Get.snackbar("Error",
                                      "Please enter a valid phone number",
                                      backgroundColor: Colors.white);
                                } else {
                                  _sendOTP();
                                }
                              } else {
                                Get.snackbar("Error",
                                    "Please enter a valid phone number",
                                    backgroundColor: Colors.white);
                              }
                            },
                            child: AnbyPrimaryButton(
                              outline: false,
                              color: isLoading
                                  ? Colors.black54
                                  : AnbyColors.PrimaryColor,
                              btnText: "Login / SignUp",
                              textAlign: null,
                              fontSize: AnbySize.baseFontSize * 2,
                              icon: Icons.arrow_right_alt,
                            )),
                        SizedBox(height: AnbySize.baseSize * 2),
                      ],
                    ),
                  ]),
            ),
            secondChild: Container(
              padding: EdgeInsets.only(
                  left: AnbySize.basePadding * 2,
                  right: AnbySize.basePadding * 2,
                  top: AnbySize.basePadding * 5,
                  bottom: AnbySize.basePadding * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AnbySize.baseSize / 2),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: windowWidth,
                          margin: EdgeInsets.only(bottom: AnbySize.baseMargin),
                          child: Text(
                            "Login / SignUp",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: AnbySize.headingFontSize,
                                fontFamily: AnbyfontFamily.anbyFontBold),
                          ),
                        ),
                        SizedBox(height: AnbySize.baseSize * 3),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOtpSent = false;
                            });
                          },
                          child: CustomInputWithIcon(
                            disable: true,
                            controller: _phoneNumberControllder,
                            icon: Icons.phone,
                            hint: "Enter Phone...",
                            isPassword: false,
                            type: TextInputType.phone,
                            maxLength: 10,
                            fontSize: AnbySize.baseFontSize * 2,
                            suffix: Text(
                              "Edit",
                              style: TextStyle(
                                  color: AnbyColors.PrimaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(height: AnbySize.baseSize),
                        CustomInputWithIcon(
                          disable: false,
                          controller: _verifyControllder,
                          icon: Icons.code,
                          hint: "Enter Otp",
                          isPassword: false,
                          type: TextInputType.phone,
                          maxLength: 10,
                          fontSize: AnbySize.baseFontSize * 2,
                          suffix: null,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AnbySize.baseSize * 2,
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              if (_verifyControllder.text.isNotEmpty) {
                                _verifyOtp();
                              } else {
                                Get.snackbar(
                                    "Error", "Please enter a valid OTP");
                              }
                            },
                            child: AnbyPrimaryButton(
                              outline: false,
                              color: isLoading
                                  ? Colors.black54
                                  : AnbyColors.PrimaryColor,
                              btnText: "Verify OTP",
                              fontSize: AnbySize.baseFontSize * 1.5,
                              textAlign: null,
                              icon: Icons.arrow_right_alt,
                            )),
                      ],
                    ),
                  ]),
            ),
            crossFadeState: isOtpSent
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 500),
          )
        ],
      ),
    ));
  }
}
