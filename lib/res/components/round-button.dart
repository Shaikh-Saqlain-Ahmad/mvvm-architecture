import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: Appcolors.buttonColor,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: loading
                ? CircleAvatar()
                : Text(
                    title,
                    style: TextStyle(color: Appcolors.whiteColor),
                  ),
          ),
        ));
  }
}
