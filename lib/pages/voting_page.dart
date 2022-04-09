import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:voting_dapp/pages/dashboard_user.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/services/smart_contract_functions.dart';
import 'package:voting_dapp/voting_page_cubit.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/candidate_voting_view.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';

class VotingPage extends StatefulWidget {
  final ethClientInfo;
  final String privateKey;

  const VotingPage(
      {Key? key, required this.ethClientInfo, required this.privateKey})
      : super(key: key);

  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {

  late VotingPageCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<VotingPageCubit>(context);
    _cubit.getVoterInfo(widget.privateKey);
    // _cubit.getCandidates();
    super.initState();
  }


/*
  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<VotingPageCubit, VotingPageState>(
          builder: (context, state) {
            if(state is Error){
              return Center(child: Text(state.msg),);
            }
            if(state is UnAuthorised){
              return Center(child: Text("You are unauthorised :("),);
            }
            if(state is VotedSuccessfully){


              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Voted successfully!'),
                ));
              });
            }
            if(state is ReceivedCandidates){

              if(state.candidates.isEmpty){
                return const Center(child: Text("No candidates found!!!"),);
              }else{
                return ScrollConfiguration(
                  behavior: NoGlowBehaviour(),
                  child: ListView.builder(itemCount: state.candidates.length,itemBuilder: (_,index){
                    var candidate = state.candidates[index];
                    return CandidateVotingView(txtTitle: candidate.name,isVotingEnabled: candidate.isEnabled, onVoteClick: () {
                      _cubit.submitVote(index, widget.ethClientInfo, widget.privateKey);

                    }, isVoted:candidate.gotVote,);
                  }),
                );
              }

            }
            return const Center(
              child: SpinKitWave(
                color: AppColors.primary,
              ),
            );
          },
        ),
      ),
    );
  }

  showPopUp(context,String title){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(

        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.imgBharatBlockChain),
            Text(title),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {

            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


}

