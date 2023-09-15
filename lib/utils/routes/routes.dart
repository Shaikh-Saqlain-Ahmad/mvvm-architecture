import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes-name.dart';
import 'package:mvvm_architecture/view/home-screen.dart';
import 'package:mvvm_architecture/view/login-view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("no routes defined"),
            ),
          );
        });
    }
  }
}
