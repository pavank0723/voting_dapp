import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:voting_dapp/pages/electionInfo.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/services/smart_contract_functions.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';
import 'package:voting_dapp/widgets/view_image_with_title.dart';

class MyElectionPage extends StatefulWidget {
  final ethClientInfo;
  const MyElectionPage({Key? key, required this.ethClientInfo}) : super(key: key);

  @override
  _MyElectionPageState createState() => _MyElectionPageState();
}

class _MyElectionPageState extends State<MyElectionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              const AppBackNavBar(txtTitle: "All Election",imgUrl: AppImages.icBackArrow,),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder<List>(future: getElectionNum(widget.ethClientInfo),
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
                            future: electionInfo(i, widget.ethClientInfo),
                            builder: (context, candidateSnapshot){
                              if (candidateSnapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: SpinKitWave(
                                    color: AppColors.primary,
                                  ),
                                );
                              }
                              else{
                                return TemplateImageWithTitle(onItemClick:(){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ElectionInfo(
                                              ethClient: widget.ethClientInfo!,
                                              electionName: candidateSnapshot.data![0][0].toString())));
                                },txtTitle: candidateSnapshot.data![0][0].toString(),imgURL: AppImages.icMyElection,);
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
