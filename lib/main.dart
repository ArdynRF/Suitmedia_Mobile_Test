import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suitmedia_internship/core/utils/size_utils.dart';
import 'package:suitmedia_internship/theme/theme_helper.dart';
import 'package:suitmedia_internship/routes/app_routes.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'suitmedia_internship_tes',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.firstScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
