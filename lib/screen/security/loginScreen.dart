import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/util/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService = new AuthService();
  TextEditingController _phoneNumberControllder = new TextEditingController();
  bool isLoading = false;

  _sendOTP() {
    isLoading = true;
    authService.sendOTP(_phoneNumberControllder.text).then((value) => {
          if (value == true)
            {
              Get.snackbar("Success", "OTP sent successfully.",
                  backgroundColor: Colors.white),
            }
          else
            {
              isLoading = false,
              Get.snackbar("Error", "Unable to send OTP.",
                  backgroundColor: Colors.white)
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    var windowHeight = MediaQuery.of(context).size.height;
    var windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          padding: EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: windowWidth,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Login To Continue",
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 28, fontFamily: "Nunito-Bold"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: windowWidth,
                      child: Text(
                        "An otp will be sent to the registered mobile number.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontFamily: "Nunito"),
                      ),
                    ),
                    CustomInputWithIcon(
                      controller: _phoneNumberControllder,
                      icon: Icons.phone,
                      hint: "Enter Phone...",
                      isPassword: false,
                      type: TextInputType.phone,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (_phoneNumberControllder.text.isNotEmpty) {
                          String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(mobilePattern);
                          if (!regExp.hasMatch(_phoneNumberControllder.text)) {
                            Get.snackbar(
                                "Error", "Please enter a valid phone number");
                          } else {
                            _sendOTP();
                          }
                        } else {
                          Get.snackbar(
                              "Error", "Please enter a valid phone number");
                        }
                      },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : CustomPrimaryButton(
                              btnText: "Send OTP",
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ])),
    );
  }
}
