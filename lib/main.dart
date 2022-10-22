import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinsoftfilm/screen/home_view.dart';
import 'package:pinsoftfilm/screen/no_internet_connection.dart';
import 'package:pinsoftfilm/utility/language/language.dart';
import 'package:pinsoftfilm/utility/theme/custom_theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });
  var _isInternetConnectionExist;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Language(),
        locale: Locale('en', 'US'),
        theme: CustomTheme().theme,
        home: AnimatedSplashScreen.withScreenFunction(
            splash: Column(
              children: [
                Text(
                  "Pinsoft",
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            screenFunction: () async {
              var connectivityResult = await Connectivity().checkConnectivity();

              if (connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi) {
                return HomeView();
              } else {
                return NoInternetConnection();
              }
            },
            splashTransition: SplashTransition.fadeTransition));
  }
}
