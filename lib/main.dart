import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:spell_out/principal/home_page.dart';
import 'package:spell_out/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _startApp();
}

void _startApp() {
  return runApp(GetMaterialApp(
    theme: ThemeData.light(),
    title: 'Spell out',
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.rightToLeft,
    // getPages: Router.routes,
    // initialRoute: '/splash',
    // navigatorObservers: [
    //   SentryNavigatorObserver(),
    // ],
    home: SplashScreen(),
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(onPressed: () {}),
//         appBar: AppBar(
//           title: const Text('prueba App Bar'),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
