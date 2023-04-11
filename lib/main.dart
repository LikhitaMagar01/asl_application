import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_app/screens/signin.dart';

List<CameraDescription>? cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'American Sign Language Dectection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}
