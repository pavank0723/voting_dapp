import 'package:flutter/material.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/app_string.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/res/style_text.dart';
import 'package:voting_dapp/widgets/view_my_rich_text_nr.dart';

class ImgWithAppName extends StatelessWidget {
  const ImgWithAppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(width:80,height: 80,child: Image.asset(AppImages.imgBharatBlockChain)),
        ViewMyRichTextNr(
          text1: AppStrings.App_Text1,
          text2: AppStrings.App_Text2,
          txtStyle1: AppTextStyle.headline4(txtColor: AppColors.primary),
          txtStyle2: AppTextStyle.headline4(txtColor: AppColors.primaryDark),
        ),
      ],
    );
  }
}
