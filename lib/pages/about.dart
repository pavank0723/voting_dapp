import 'package:flutter/material.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';
import 'package:voting_dapp/widgets/view_image_with_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              const AppBackNavBar(txtTitle: "About Us",imgUrl: AppImages.icBackArrow,),
              const SizedBox(
                height: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
