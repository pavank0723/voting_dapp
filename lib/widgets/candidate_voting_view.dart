import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/res/style_text.dart';

class CandidateVotingView extends StatefulWidget {
  final String imgURL;
  final String txtTitle;
  final String txtSubTitle;
  final bool isVotingEnabled;
  final bool isVoted;
  final Function() onVoteClick;
  final Color bgColor;
  final Color outColor;
  final Color txtColor;
  final double sImg;

  const CandidateVotingView({
    Key? key,
    this.imgURL = AppImages.icCandidates,
    this.txtTitle = "Title",
    this.txtSubTitle = "",
    this.bgColor = AppColors.primary,
    this.outColor = AppColors.primary,
    this.txtColor = AppColors.greyLightest,
    this.sImg = 40, required this.isVotingEnabled, required this.isVoted, required this.onVoteClick,
  }) : super(key: key);

  @override
  State<CandidateVotingView> createState() => _CandidateVotingViewState();
}

class _CandidateVotingViewState extends State<CandidateVotingView> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: MaterialButton(

        onPressed: () {  },
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
              if(widget.isVotingEnabled) ElevatedButton(
                onPressed: (){
                  widget.onVoteClick();
                }, child: Text('Vote'),
              ),
              if(widget.isVoted) TextButton.icon(onPressed: null, icon: Icon(Icons.check,color: Colors.green,), label: Text("Voted",style: TextStyle(color: Colors.green),)),
            ],
          ),
        ),
      ),
    );
  }
}
