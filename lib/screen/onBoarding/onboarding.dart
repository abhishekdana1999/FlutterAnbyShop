import 'package:anbyshop/screen/onBoarding/getStarted.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/widget/arrow_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const blue = CustomColors.PrimaryColor;
const kTitleStyle = TextStyle(
    fontSize: 28, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 16, color: Color(0xFF88869f));

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = new PageController(initialPage: 0);

  int pageState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
              Slide(
                  bg: Colors.green,
                  hero: Image.asset(
                    "assets/images/shopOnline.png",
                    fit: BoxFit.contain,
                  ),
                  title: "AnbyShop",
                  subtitle:
                      "Get your order deliver at your doorstep with zero contact delivery.",
                  onNext: nextPage),
              Slide(
                  bg: Colors.orange,
                  hero: Image.asset(
                    "assets/images/delivery.png",
                    fit: BoxFit.contain,
                  ),
                  title: "Free & Fast",
                  subtitle:
                      "Get your first order for free, shop and get your order deliver with 24hrs.",
                  onNext: nextPage),
              Slide(
                  bg: Colors.red,
                  hero: Image.asset(
                    "assets/images/secure.png",
                    fit: BoxFit.contain,
                  ),
                  title: "Secure",
                  subtitle: "Your order is completely secure with anbyshop.",
                  onNext: nextPage),
              GetStartedScreen()
            ])),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;
  final Color bg;

  const Slide(
      {Key key, this.hero, this.title, this.subtitle, this.onNext, this.bg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: hero,
            height: MediaQuery.of(context).size.height / 1.7,
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 10.0),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: kTitleStyle,
                          ),
                          ProgressButton(onNext: onNext),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        subtitle,
                        style: kSubtitleStyle,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: InkWell(
                      onTap: onNext,
                      child: Text(
                        "Skip",
                        style:
                            TextStyle(fontSize: 14, color: Colors.orange[700]),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: InkWell(
            onTap: onNext,
            child: Container(
              height: 40,
              width: 40,
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/arrow.svg",
                  width: 10,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99), color: blue),
            ),
          ),
        )
      ]),
    );
  }
}
