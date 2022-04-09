import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_dapp/pages/dashboard_admin.dart';
import 'package:voting_dapp/pages/dashboard_user.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/res/style_text.dart';
import 'package:voting_dapp/widgets/img_with_app_name.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';
import 'package:voting_dapp/widgets/view_options.dart';

import '../utils/constants.dart';

class LayoutUserType extends StatelessWidget {
  const LayoutUserType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(

                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Container(
                  width: double.infinity,
                  child: Column(

                    children: [

                      const ImgWithAppName(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Please select any one option",style: AppTextStyle.body2(txtColor: AppColors.primaryDarkest,wFont: FontWeight.w500),),
                      const SizedBox(
                        height: 20,
                      ),
                      TemplateSelectOption(
                        imgURL: AppImages.icAdmin,
                        txtTitle: "I'm Admin",
                        navPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardAdmin()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Row(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              TemplateSelectOption(
                                txtTitle: "Voter1",
                                imgURL: AppImages.icUser,
                                navPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashboardUser(privateKey: voter1_private_key)));
                                },
                              ),

                              TemplateSelectOption(
                                txtTitle: "Voter2",
                                imgURL: AppImages.icUser,
                                navPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  DashboardUser(privateKey: voter2_private_key)));
                                },
                              ),

                              TemplateSelectOption(
                                txtTitle: "Voter3",
                                imgURL: AppImages.icUser,
                                navPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashboardUser(privateKey: voter3_private_key)));
                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
