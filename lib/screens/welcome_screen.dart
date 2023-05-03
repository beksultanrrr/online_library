import 'package:online_library/constants.dart';
import 'package:online_library/screens/login_screen.dart';
import 'package:online_library/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:online_library/components/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      //upperBound: 100,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);   Curves class animation

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller); //Tween class animation for Colors

    controller.forward();
    // controller.reverse(from: 1)

    controller.addListener(() {
      setState(() {});
      // print(animation.value * 100);
    });

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   print(status);
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: SizedBox(
                    height: 60,
                    child: Image.network(
                        "https://thumbs.dreamstime.com/b/hand-book-logo-illustration-art-background-43965136.jpg"), //animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: const Duration(milliseconds: 500),
                  text: const ["Библиотека"],
                  textStyle: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                buttonColor: kLogInButtonColor,
                buttonTitle: "Вход",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                buttonColor: kRegisterButtonColor,
                buttonTitle: "Зарегистрироватьcя",
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
