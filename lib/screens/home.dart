import 'package:flutter/material.dart';
import 'package:sign_language_app/screens/signin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const SignInScreen()));
      },
      ),

      ),
    );
  }
}
