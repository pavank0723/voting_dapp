import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting_dapp/models/candidate.dart';
import 'package:voting_dapp/models/voter_model.dart';
import 'package:voting_dapp/services/smart_contract_functions.dart';
import 'package:voting_dapp/utils/constants.dart';
import 'package:web3dart/web3dart.dart';

part 'voting_page_state.dart';

class VotingPageCubit extends Cubit<VotingPageState> {
  VotingPageCubit() : super(VotingPageInitial());
  late VoterModel voterModel;
  void getCandidates() async{
    emit(Loading());
    try{
      var candidates = await getAllCandidates();
      if(voterModel.isVoted){
        candidates.forEach((candidate) {
          candidate.isEnabled = false;
        });
        candidates[voterModel.whom.toInt()].gotVote = true;
        emit(ReceivedCandidates(candidates));
      }
      else{
        emit(ReceivedCandidates(candidates));
      }

    }catch(ex){
      emit(Error(ex.toString()));
    }
  }
  void submitVote(int index,Web3Client ethClient,String privateKey) async{
    emit(Voting());
    try{
      var result = await vote(index,ethClient,privateKey);

     emit(VotedSuccessfully());

    }catch(ex){
      emit(Error(ex.toString()));
    }
  }
  void getVoterInfo(String privateKey) async{
    emit(Loading());
    try{
      var voterInfo = await getVoterInfoFromRemote(getVoterAddressByKey(privateKey));
      voterModel = voterInfo;
      if(voterModel.isAuthorized){
        getCandidates();
      }else{
        emit(UnAuthorised());
      }
      // emit(ReceivedCandidates());
    }catch(ex){
      emit(Error(ex.toString()));
    }
  }
}
