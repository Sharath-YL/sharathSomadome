import 'package:flutter/material.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/IndexScreens/book/upcomingdescritionscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/googlemaps/currentlocationscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/googlemaps/googlemapscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/googlemaps/googlemapsdescriptionscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/pastordersessionscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/recomendationscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/viewsessionscreen.dart';
import 'package:somadome_p/views/IndexScreens/learn/learn_screen.dart';
import 'package:somadome_p/views/IndexScreens/profile/Accountinfo.dart';
import 'package:somadome_p/views/IndexScreens/profile/ProfilepaymentScreen.dart';
import 'package:somadome_p/views/IndexScreens/profile/linkAccountscreen.dart';
import 'package:somadome_p/views/IndexScreens/profile/profile_screen.dart';
import 'package:somadome_p/views/IndexScreens/profile/pushnotificationscreen.dart';
import 'package:somadome_p/views/ReserveScreens/completereservescreen.dart';
import 'package:somadome_p/views/ReserveScreens/couponscreen.dart';
import 'package:somadome_p/views/ReserveScreens/paymentcompletescreen.dart';
import 'package:somadome_p/views/ReserveScreens/paymentmethodscreen.dart';
import 'package:somadome_p/views/ReserveScreens/paymentscreen.dart';
import 'package:somadome_p/views/ReserveScreens/reservescreens.dart';
import 'package:somadome_p/views/auth_screeen/Loginscreens.dart';
import 'package:somadome_p/views/auth_screeen/otpscreen.dart';
import 'package:somadome_p/views/auth_screeen/reset_passcode.dart';
import 'package:somadome_p/views/auth_screeen/resetpasscode_successful.dart';
import 'package:somadome_p/views/auth_screeen/signin_page.dart';
import 'package:somadome_p/views/cancelationscreens/cancelationscreen.dart';
import 'package:somadome_p/views/connectscreens/connectscreen.dart';
import 'package:somadome_p/views/date_timeselections/contactdetailsscreen.dart';
import 'package:somadome_p/views/date_timeselections/dateselection.dart';
import 'package:somadome_p/views/date_timeselections/timeselection.dart';
import 'package:somadome_p/views/learnandstuffs/learnandstuffdescriptionscreen.dart';
import 'package:somadome_p/views/learnandstuffs/topicsnamescreen.dart';
import 'package:somadome_p/views/onboardings/onboardingscreen.dart';
import 'package:somadome_p/views/sessionhelpers/beginintentionscreen.dart';
import 'package:somadome_p/views/sessionhelpers/beginsessionscreen.dart';
import 'package:somadome_p/views/sessionhelpers/menusessionscreen.dart';
import 'package:somadome_p/views/sessionhelpers/sessionhelperdescripiotnscreen.dart';
import 'package:somadome_p/views/sessionhelpers/sessionhelpermeditation.dart';
import 'package:somadome_p/views/sessionhelpers/sessionhelperscreen.dart';
import 'package:somadome_p/views/sessionhelpers/startsessionscreen.dart';
import 'package:somadome_p/views/splashscreens/splashscreen.dart';
import 'package:somadome_p/views/vedioplayerscreens/realquickscreen.dart';
import 'package:somadome_p/views/vedioplayerscreens/vedioplayscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboardingscreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreens());
      case RoutesName.signupscreen:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      // case RoutesName.welcomescreen:
      //   return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case RoutesName.resetpassword:
        return MaterialPageRoute(builder: (context) => ResetPasscode());
      case RoutesName.upcomingdescriptionscren:
        return MaterialPageRoute(
          builder: (context) => Upcomingdescritionscreen(),
        );
      case RoutesName.viewsessioniscreen:
        return MaterialPageRoute(builder: (context) => Viewsessionscreen());

      case RoutesName.loginscreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      // case RoutesName.verifyaccount:
      //   return MaterialPageRoute(builder: (context) => VerifyAcount());
      case RoutesName.dateselection:
        return MaterialPageRoute(builder: (context) => Dateselection());
      case RoutesName.timeselectionscreen:
        return MaterialPageRoute(builder: (context) => Timeselection());
      case RoutesName.reservescreen:
        return MaterialPageRoute(builder: (context) => Reservescreens());
      case RoutesName.completereservescreen:
        return MaterialPageRoute(builder: (context) => Completereservescreen());
      case RoutesName.profilescreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case RoutesName.cancelationscreen:
        return MaterialPageRoute(builder: (context) => Cancelationscreen());
      case RoutesName.profilepaymentscreen: 
        return MaterialPageRoute(builder: (context) => ProfilePaymentScreen()); 
      case RoutesName.realquickscreen: 
        return MaterialPageRoute(builder: (contxet)=>Realquickscreen());
      case RoutesName.pastorderscreen: 
        return MaterialPageRoute(
          builder: (context) => Pastordersessionscreen(),
        );
      case RoutesName.sessionhelperdescriptionscreen:
        final id = settings.arguments;

        if (id is String) {
          return MaterialPageRoute(
            builder: (context) => Sessionhelperdescripiotnscreen(id: id),
          );
        } else {
          return MaterialPageRoute(
            builder:
                (context) =>
                    Scaffold(body: Center(child: Text("Page not found"))),
          );
        }
      case RoutesName.startsessionscreen:
        return MaterialPageRoute(builder: (context) => Startsessionscreen());
      case RoutesName.beginsessionscreen:
        return MaterialPageRoute(builder: (context) => Beginsessionscreen());
      case RoutesName.beginintenetionscreen:
        return MaterialPageRoute(builder: (context) => Beginintentionscreen());

      case RoutesName.sessionhelpermeditationscreen:
        final id = settings.arguments;

        if (id is String) {
          return MaterialPageRoute(
            builder: (context) => Sessionhelpermeditationscreen(id: id),
          );
        } else {
          return MaterialPageRoute(
            builder:
                (context) =>
                    Scaffold(body: Center(child: Text("Page not found"))),
          );
        }
      case RoutesName.menusessionscreen:
        return MaterialPageRoute(builder: (context) => Menusessionscreen());
      case RoutesName.vedioplayscreen:
        return MaterialPageRoute(builder: (context) => Vedioplayscreen());
      case RoutesName.pushnotificatinscreen:
        return MaterialPageRoute(
          builder: (context) => Pushnotificationscreen(),
        );
      case RoutesName.accountinfoscreen:
        return MaterialPageRoute(builder: (context) => AccountinfoScreen());
      case RoutesName.paymentscreen:
        return MaterialPageRoute(builder: (context) => Paymentscreen());
      case RoutesName.paymentmethodscreen:
        return MaterialPageRoute(builder: (context) => Paymentmethodscreen());
      case RoutesName.couponscreen:
        return MaterialPageRoute(builder: (context) => Couponscreen());
      case RoutesName.learnandstuffscreen:
        return MaterialPageRoute(builder: (context) => Learnandstuffscreen());
      case RoutesName.topicscreen:
        return MaterialPageRoute(builder: (context) => TopicsNameScreen());
      case RoutesName.learnandstuffdescriptionscreen:
        return MaterialPageRoute(
          builder: (context) => Learnandstuffdescriptionscreen(),
        );
      case RoutesName.recommandation:
        return MaterialPageRoute(builder: (context) => RecommendationsScreen());
      case RoutesName.connectscreen:
        return MaterialPageRoute(builder: (context) => Connectscreen());
      case RoutesName.sessionhelperscreen:
        return MaterialPageRoute(builder: (context) => Sessionhelperscreen());
      case RoutesName.splashscreen:
        return MaterialPageRoute(builder: (context) => Splashscreen());
      case RoutesName.googlemapdescitionscreen:
        return MaterialPageRoute(
          builder: (context) => Googlemapsdescriptionscreen(),
        );
      case RoutesName.linkacconutscreen:
        return MaterialPageRoute(builder: (context) => Linkaccountscreen());
      case RoutesName.googlemapscreen:
        return MaterialPageRoute(builder: (context) => Googlemapscreen());
      case RoutesName.currentlocationscreen:
        return MaterialPageRoute(builder: (context) => Currentlocationscreen());
      case RoutesName.paymentcompletescreen:
        return MaterialPageRoute(builder: (context) => Paymentcompletescreen());

      case RoutesName.otpscreen:
        final phoneNumber = settings.arguments;
        if (phoneNumber is String) {
          return MaterialPageRoute(
            builder: (context) => Otpscreen(phonenumber: phoneNumber),
          );
        } else {
          return MaterialPageRoute(
            builder:
                (context) =>
                    Scaffold(body: Center(child: Text("Page not found"))),
          );
        }
      case RoutesName.contactdetailsScren:
        return MaterialPageRoute(builder: (context) => Contactdetailsscreen());

      case RoutesName.resetpasscodesuccessfully:
        return MaterialPageRoute(
          builder: (context) => ResetpasscodeSuccessful(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
