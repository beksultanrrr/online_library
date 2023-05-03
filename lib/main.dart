import 'package:firebase_core/firebase_core.dart';
import 'package:online_library/screens/grades/fifth_grades.dart';
import 'package:online_library/screens/grades/fourth_grades.dart';
import 'package:online_library/screens/grades/seventh.dart';
import 'package:online_library/screens/grades/sixth.dart';

import 'package:flutter/material.dart';
import 'package:online_library/screens/welcome_screen.dart';
import 'package:online_library/screens/login_screen.dart';
import 'package:online_library/screens/registration_screen.dart';
import 'package:online_library/screens/chat_screen.dart';
import 'screens/bottom_navigation.dart';
import 'screens/grades/first_grades.dart';
import 'screens/grades/second_grades.dart';
import 'screens/grades/third_grades.dart';

void main() async {
  // await WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // print(await messaging.getToken());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
        BottomNavigation.id: (context) => const BottomNavigation(),
        FirstGrades.id: (context) => const FirstGrades(),
        SecondGrades.id: (context) => const SecondGrades(),
        ThirdGrades.id: (context) => const ThirdGrades(),
        FourhGrades.id: (context) => const FourhGrades(),
        FifthGrades.id: (context) => const FifthGrades(),
        SixthGrades.id: (context) => const SixthGrades(),
        SeventhGrades.id: (context) => const SeventhGrades(),
      },
    );
  }
}
