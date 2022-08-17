import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/pages/user/user_main.dart';
import 'package:flutter_firebase_auth/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyChz93rHvpMZoVqw0FJ4VYxmuhVykyFzww",
      appId: "1:667080396602:android:c5419036115995c6d8ca03",
      messagingSenderId: "667080396602",
      projectId: "flutter-fire-auth-e7847",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              builder: (context, child) => ResponsiveWrapper.builder(child,
                  maxWidth: 1200,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(400, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(760, name: TABLET),
                    const ResponsiveBreakpoint.resize(1020, name: DESKTOP),
                    const ResponsiveBreakpoint.autoScale(1440, name: '4K'),
                  ],
                  background: Container(color: const Color(0xFFF5F5F5))),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Firebase Auth',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Welcome(),
            );
          },
        );
      },
    );
  }
}
