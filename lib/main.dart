import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/pages/login.dart';
import 'package:flutter_firebase_auth/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Firebase Auth',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: welcome(),
          );
        });
  }
}
