// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tictokgame/form/datepicker.dart';
// import 'package:tictokgame/form/rdobtn.dart';
// import 'package:tictokgame/simpleapp/calculator.dart';
// import 'package:tictokgame/simpleapp/currency.dart';
// import 'animation/animatinbutton.dart';
// import 'buttonprectic/bottombutton.dart';
// import 'buttonprectic/dropdownbutton.dart';
// import 'buttonprectic/enabledisable.dart';
// import 'buttonprectic/test1.dart';
// import 'dropdownbuttoon/dropdownbuttoon.dart';
// import 'dropdownbuttoon/popupmenubutton.dart';
// import 'formvalidation/formvalidation.dart';
// import 'mock JSON API/userdatatable.dart';
// import 'navigatorpreacts.dart/drawermenu.dart';
// import 'navigatorpreacts.dart/masterpages.dart';
// import 'navigatorpreacts.dart/onboarding.dart';
// import 'navigatorpreacts.dart/pageroutename.dart';
// import 'navigatorpreacts.dart/routenamepagenavigator.dart';
// import 'navigatorpreacts.dart/switchrouting.dart';
// import 'nextprev/nexprevscreenpage.dart';
// import 'responsicelayout.dart';
// import 'shareprefrancetest/bestscore.dart';
// import 'shareprefrancetest/cardsqflitr/cart_screen.dart';
// import 'shareprefrancetest/cardsqflitr/homescrerecart.dart';
// import 'shareprefrancetest/categor/home_screen.dart';
// import 'shareprefrancetest/storeprofile.dart';
// import 'shareprefrancetest/todo.dart';
// import 'simpleapp/counterincdec.dart';
// import 'simpleapp/stopwatch.dart';
// import 'simpleapp/stopwatchworking.dart';
// import 'tableimplement/tableimp.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool? completedOnboarding = prefs.getBool('completed_onboarding') ?? false;
//   runApp(const MyApp(completedOnboarding: completedOnboarding));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // initialRoute: '/',
//       // routes: {
//       //   '/': (context) => MenuScreen(),
//       //   '/screen1': (context) => Screen1(),
//       //   '/screen2': (context) => Screen2(),
//       //   '/screen3': (context) => Screen3(),
//       // },

//       // initialRoute: '/step1',
//       // routes: {
//       //   '/step1': (context) => Step1(),
//       //   '/step2': (context) => Step2(),
//       //   '/step3': (context) => Step3(),
//       //   '/summary': (context) => SummaryScreen(),
//       // },

//       // initialRoute: '/',
//       // routes: {
//       //   '/': (context) => MasterPage(),
//       //   '/detail': (context) => DetailPage(),
//       // },

//       // initialRoute: '/home',
//       // routes: {
//       //   '/home': (context) => home(),
//       //   '/scr1': (context) => Scr1(),
//       //   '/scr2': (context) => Scr2(),
//       //   '/scr3': (context) => Scr3(),
//       // },

//       // initialRoute: '/onboarding1',
//       // routes: {
//       //   '/onboarding1': (context) => OnboardingScreen1(),
//       //   '/onboarding2': (context) => OnboardingScreen2(),
//       //   '/onboarding3': (context) => OnboardingScreen3(),
//       //   '/main': (context) => MainContentScreen(),
//       // },

//       home: CategoryHomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'form/APIUserFormScreen.dart';
import 'notification/pushnotification.dart';
import 'shareprefrancetest/fitness/exercise_log_screen.dart';
import 'shareprefrancetest/fitness/progress_screen.dart';
import 'shareprefrancetest/fitness/step_tracker_screen.dart';
import 'shareprefrancetest/onboardings/OnboardingScreen.dart';
import 'shareprefrancetest/onboardings/onboadinghome.dart';
import 'weatherapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? completedOnboarding = prefs.getBool('completed_onboarding') ?? false;

  runApp(MyApp(completedOnboarding: completedOnboarding));
}

class MyApp extends StatelessWidget {
  final bool completedOnboarding;

  MyApp({required this.completedOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Show the onboarding screen if the user hasn't completed it
      // initialRoute: completedOnboarding ? '/home' : '/onboarding',
      // routes: {
      //   '/onboarding': (context) => OnboardingScreen(),
      //   '/home': (context) => Onboadinghome(),
      // },

      home: NotificationScreen(),
      // routes: {
      //   '/log-exercise': (context) => ExerciseLogScreen(),
      //   '/progress': (context) => ProgressScreen(),
      // },
    );
  }
}
