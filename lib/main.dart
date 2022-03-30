
import 'package:authfirebase/layouts/homelayout/home.dart';
import 'package:authfirebase/modules/login/loginscreen.dart';
import 'package:authfirebase/modules/onboarding/onboarding.dart';
import 'package:authfirebase/shared/network/local/cache_helper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'shared/components/constants.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  //uId = CacheHelper.getData(key: 'uId');

  if(onBoarding != null)
  {
    if(uId != null)
    {
      widget = HomeScreen();
    } else
    {
      widget = LoginScreen();
    }
  } else
    {
      widget = OnBoardingScreen();
    }


  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(
    this.startWidget,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
