import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voting_dapp/pages/home.dart';
import 'package:voting_dapp/res/app_colors.dart';

class ElectionSetu extends StatelessWidget {
  const ElectionSetu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight
    ));
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatchColor,


      ),
    );
  }
}
