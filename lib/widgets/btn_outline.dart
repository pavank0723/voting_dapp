import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_dapp/res/app_colors.dart';

class BtnOutline extends StatelessWidget {
  final String title;
  final Function()? onBtnPressed;

  const BtnOutline({Key? key, this.title = "Outline", this.onBtnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      color: AppColors.greyLightest,
      onPressed: () => onBtnPressed!(),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(color: AppColors.primary),
      ),
      textColor: AppColors.greyLightest,
      shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: AppColors.primary, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
