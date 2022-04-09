import 'package:flutter/cupertino.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/style_text.dart';

class ViewMyRichText extends StatelessWidget {
  final String text1;
  final String text2;
  late TextStyle? txtStyle1;
  late TextStyle? txtStyle2;

  ViewMyRichText({
    Key? key,
    this.text1 = "Text1",
    this.text2 = "Text2",
    this.txtStyle1,
    this.txtStyle2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    txtStyle1 = txtStyle1 ?? AppTextStyle.overlieRF1(txtColor: AppColors.greyDark,wFont: FontWeight.w500);
    txtStyle2 = txtStyle2 ?? AppTextStyle.overlieRF1(txtColor: AppColors.greyBefore, wFont: FontWeight.w500);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: txtStyle1,
          ),
          TextSpan(
            text: '\n${text2}',
            style: txtStyle2,
          ),
        ],
      ),
    );
  }
}
