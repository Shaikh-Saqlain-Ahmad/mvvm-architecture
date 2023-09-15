import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/round-button.dart';
import 'package:mvvm_architecture/utils/routes/routes-name.dart';
import 'package:mvvm_architecture/view/home-screen.dart';

import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier(true);
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: InputDecoration(
              hintText: "saqlain@gmail.com",
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, emailFocusNode, passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {
              return TextFormField(
                controller: _passwordController,
                focusNode: passwordFocusNode,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: _obsecurePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility))),
              );
            },
          ),
          SizedBox(
            height: height * 0.085,
          ),
          RoundButton(
              title: "Login",
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("please enter email", context);
                } else if (_passwordController.toString().isEmpty) {
                  Utils.flushBarErrorMessage("please enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Password must be 6 character or longer", context);
                } else {
                  print("api hit");
                }
              })
        ],
      ),
    ));
  }
}
