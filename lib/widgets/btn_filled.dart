import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_dapp/res/app_colors.dart';

class BtnFilled extends StatelessWidget {
  final String title;
  final Function()? onBtnPressed;

  const BtnFilled({Key? key, this.title = "Filled", this.onBtnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      textColor: Colors.white,
      color: AppColors.primary,
      child: Text(
        title.toUpperCase(),
      ),
      onPressed: () => onBtnPressed!(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
