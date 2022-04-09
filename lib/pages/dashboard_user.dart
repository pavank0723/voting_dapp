import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:voting_dapp/pages/about.dart';
import 'package:voting_dapp/pages/faq.dart';
import 'package:voting_dapp/pages/voting_page.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/res/style_text.dart';
import 'package:voting_dapp/utils/constants.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/img_with_app_name.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';
import 'package:voting_dapp/widgets/view_options.dart';
import 'package:web3dart/web3dart.dart';

class DashboardUser extends StatefulWidget {
  final String privateKey;

  const DashboardUser({Key? key, required this.privateKey}) : super(key: key);

  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  Client? httpClient;
  Web3Client? ethClient;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppBackNavBar(
                    imgUrl: AppImages.icBackArrow,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const ImgWithAppName(),
                  Text(
                    "User",
                    style:
                        AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TemplateSelectOption(
                            navPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VotingPage(
                                          ethClientInfo: ethClient!,
                                          privateKey: widget.privateKey,
                                        ))),
                            txtTitle: "Give Vote",
                            imgURL: AppImages.icVote,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TemplateSelectOption(
                            navPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage())),
                            txtTitle: "About",
                            imgURL: AppImages.icAbout,
                          ),
                          TemplateSelectOption(
                            navPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FAQPage())),
                            txtTitle: "FAQ",
                            imgURL: AppImages.icFAQ,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
