import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_app/main.dart';
import 'package:sign_language_app/screens/signin.dart';
import 'package:sign_language_app/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((ImageStream) {
            cameraImage = ImageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('American Sign Language'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            iconSize: 50,
          )
        ]),
        // ElevatedButton(
        //   child: const Text("Logout"),
        //   onPressed: () {
        //     FirebaseAuth.instance.signOut().then((value) {
        //       print("signout");
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const SignInScreen()));
        //     });
        //   },
        // ),
      ),
    );
  }
}
