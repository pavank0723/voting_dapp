import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_dapp/election_setu.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/splash_screen.dart';
import 'package:voting_dapp/voting_page_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>VotingPageCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: AppColors.primarySwatchColor,
            scaffoldBackgroundColor: AppColors.greyLightest),
        home: SplashScreen(),
      ),
    ),
  );
}



