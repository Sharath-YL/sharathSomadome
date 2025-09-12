import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/utis/routes/Routes.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/begin_view_provider.dart';
import 'package:somadome_p/viewmodels/beginintention_view_provider.dart';
import 'package:somadome_p/viewmodels/bottom_nav_viewmodel.dart';
import 'package:somadome_p/viewmodels/controllers_provider.dart';
import 'package:somadome_p/viewmodels/location_view_provider.dart';
import 'package:somadome_p/viewmodels/recommdation_provider.dart';
import 'package:somadome_p/viewmodels/session_helper_provider.dart';
import 'package:somadome_p/viewmodels/upcmingmodelview_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}    

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
            ChangeNotifierProvider(create: (_) => UpcomingmodelviewProvider()),
            ChangeNotifierProvider(create: (_) => ControllersProvider()),
            ChangeNotifierProvider(create: (_) => LocationViewProvider()),
            ChangeNotifierProvider(create: (_) => RecommdationProvider()),
            ChangeNotifierProvider(
              create: (context) => SessionHelperProvider(),
            ),
            ChangeNotifierProvider(create:  (_) => ControllersProvider()),
            ChangeNotifierProvider(create: (_)=>BeginViewProvider()), 
            ChangeNotifierProvider(create: (_)=>BeginintentionViewProvider())
          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Somadome App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            ),
            initialRoute: RoutesName.splashscreen,
            onGenerateRoute: Routes.generateRoute,
            // home: Dateselection(),
          ),
        );
      },
      // child: RootBottomNav(),
    );
  }
}
