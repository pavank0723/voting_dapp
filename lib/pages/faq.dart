import 'package:flutter/material.dart';
import 'package:voting_dapp/pages/faq_body.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: Scaffold(
          body: ListView(
            children: [
              const AppBackNavBar(txtTitle: "FAQ",imgUrl: AppImages.icBackArrow,),
              const SizedBox(
                height: 15,
              ),
              FAQBodyPage()
            ],
          ),
        ),
      ),
    );
  }
}
