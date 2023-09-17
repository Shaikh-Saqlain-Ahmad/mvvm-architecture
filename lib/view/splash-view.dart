import 'package:flutter/material.dart';
import 'package:mvvm_architecture/view-model/services/splash-services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Text(
              "Splash Screen",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ]),
        ),
      ),
    );
  }
}
