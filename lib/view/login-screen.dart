import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes-name.dart';
import 'package:mvvm_architecture/view/home-screen.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, RoutesName.home);
            Utils.toastmessage("Welcome");
            Utils.flushBarErrorMessage("Slow internet connection", context);
            Utils.snackBar("App is running in background", context);
          },
          child: Text("click"),
        ),
      ),
    );
  }
}
