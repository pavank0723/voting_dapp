import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/res/style_text.dart';

class TemplateImageWithTitle extends StatefulWidget {
  final String imgURL;
  final String txtTitle;
  final Function()? onItemClick;
  final String txtSubTitle;
  final Color bgColor;
  final Color outColor;
  final Color txtColor;
  final double sImg;

  const TemplateImageWithTitle({
    Key? key,
    this.imgURL = AppImages.icCandidates,
    this.txtTitle = "Title",
    this.txtSubTitle = "",
    this.bgColor = AppColors.primary,
    this.outColor = AppColors.primary,
    this.txtColor = AppColors.greyLightest,
    this.sImg = 40, this.onItemClick,
  }) : super(key: key);

  @override
  State<TemplateImageWithTitle> createState() => _TemplateSelectConsultationState();
}

class _TemplateSelectConsultationState extends State<TemplateImageWithTitle> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: MaterialButton(

        onPressed: widget.onItemClick,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 5),
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
              color:AppColors.greyLightest),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                widget.imgURL,
                color: AppColors.primary,
                height: widget.sImg,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  widget.txtTitle,
                  style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
                ),
              ),

              Text(
                widget.txtSubTitle,
                style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
