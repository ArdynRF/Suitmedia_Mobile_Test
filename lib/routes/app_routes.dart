import 'package:flutter/material.dart';
import 'package:suitmedia_internship/presentation/first_screen/first_screen.dart';
import 'package:suitmedia_internship/presentation/second_screen/second_screen.dart';
import 'package:suitmedia_internship/presentation/third_screen/third_screen.dart';

class AppRoutes {
  static const String firstScreen = '/first_screen';

  static const String secondScreen = '/second_screen';

  static const String thirdScreen = '/third_screen';


  static Map<String, WidgetBuilder> routes = {
    firstScreen: (context) => FirstScreen(),
    secondScreen: (context) => SecondScreen(
          name: '',
          selectedUserName: '',
        ),
    thirdScreen: (context) => ThirdScreen(),
  };
}
