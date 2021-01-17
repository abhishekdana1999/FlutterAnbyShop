import 'package:anbyshop/screen/security/loginScreen.dart';
import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/util/animation.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyPrimaryButton.dart';
import 'package:anbyshop/util/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  void initState() {
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
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                              fontFamily: "NHaasGroteskTXPro-BD",
                              fontSize: AnbySize.headingFontSize),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          "Login to Anbyshop and start shopping also get your first order deliver for free.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: _headingColor,
                              fontSize: AnbySize.regularFontSize),
                        ),
                      )
                    ],
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
                      var pageRouteBuilder2 = PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoginScreen(),
                        transitionsBuilder: transitionBuilder,
                        transitionDuration: Duration(milliseconds: 1000),
                      );
                      var pageRouteBuilder = pageRouteBuilder2;
                      Navigator.push(
                        context,
                        pageRouteBuilder,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 28),
                      width: double.infinity,
                      child: AnbyPrimaryButton(
                        btnText: "Get Started",
                        outline: true,
                        color: AnbyColors.PrimaryColor,
                        icon: Icons.arrow_right_alt,
                        fontSize: AnbySize.baseFontSize * 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ]),
    );
  }
}
