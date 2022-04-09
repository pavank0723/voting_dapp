class Candidate{
  final String name;
  final BigInt noOfVotes;
  bool isEnabled=true;
  bool gotVote=false;

  Candidate(this.name, this.noOfVotes);
}