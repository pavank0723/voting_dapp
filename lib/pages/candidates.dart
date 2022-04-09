import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/services/smart_contract_functions.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';
import 'package:voting_dapp/widgets/view_image_with_title.dart';

class CandidatePage extends StatefulWidget {
  final ethClientInfo;
  const CandidatePage({Key? key, required this.ethClientInfo}) : super(key: key);

  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              const AppBackNavBar(txtTitle: "All Candidate",imgUrl: AppImages.icBackArrow,),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder<List>(future: getCandidatesNum(widget.ethClientInfo),
                builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitWave(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  else{
                    return Column(
                      children: [
                        for(int i = 0; i<snapshot.data![0].toInt();i++)
                          FutureBuilder<List>(
                            future: candidateInfo(i, widget.ethClientInfo),
                            builder: (context, candidateSnapshot){
                              if (candidateSnapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: SpinKitWave(
                                    color: AppColors.primary,
                                  ),
                                );
                              }
                              else{
                                // return ListTile(
                                //   title: Text('Name: '+candidateSnapshot.data![0][0].toString()),
                                // );
                                return TemplateImageWithTitle(txtTitle: candidateSnapshot.data![0][0].toString(),txtSubTitle: candidateSnapshot.data![0][1].toString(),);
                              }
                            },
                          )
                      ],
                    );
                  }
                },)
            ],
          ),
        ),
      ),
    );
  }
}

