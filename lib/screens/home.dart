import 'package:asl_application/screens/signin.dart';
import 'package:flutter/material.dart';

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
