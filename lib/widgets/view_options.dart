import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/res/style_text.dart';

class TemplateSelectOption extends StatefulWidget {
  final String imgURL;
  final String txtTitle;
  final Color bgColor;
  final Color outColor;
  final Color txtColor;
  final double sCard;
  final double sImg;
  final Function() navPress;

  const TemplateSelectOption({
    Key? key,
    this.imgURL = AppImages.icCandidates,
    this.txtTitle = "Title",
    this.bgColor = AppColors.primary,
    this.outColor = AppColors.primary,
    this.txtColor = AppColors.greyLightest,
    this.sCard = 100,
    this.sImg = 40,
    required this.navPress,
  }) : super(key: key);

  @override
  State<TemplateSelectOption> createState() => _TemplateSelectConsultationState();
}

class _TemplateSelectConsultationState extends State<TemplateSelectOption> {
  @override
  Widget build(BuildContext context) {
    double sHeight = widget.sCard;
    double sWidth = sHeight / 2 + 50;
    return FittedBox(
      fit: BoxFit.contain,
      child: MaterialButton(
        onPressed: ()  {
        widget.navPress();

        },
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          height: sHeight,
          width: sWidth,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
              color:AppColors.greyLightest),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                widget.imgURL,
                height: widget.sImg,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.txtTitle,
                style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
