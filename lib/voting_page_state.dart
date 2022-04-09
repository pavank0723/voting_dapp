part of 'voting_page_cubit.dart';

@immutable
abstract class VotingPageState {}

class VotingPageInitial extends VotingPageState {}
class Loading extends VotingPageState {}
class Voting extends VotingPageState {}
class UnAuthorised extends VotingPageState {}
class VotedSuccessfully extends VotingPageState {}

class Error extends VotingPageState {
  final String msg;

  Error(this.msg);
}
class ReceivedVoterInfo extends VotingPageState {
  final VoterModel voterModel;

  ReceivedVoterInfo(this.voterModel);
}

class ReceivedCandidates extends VotingPageState {
  final List<Candidate> candidates;

  ReceivedCandidates(this.candidates);
}

