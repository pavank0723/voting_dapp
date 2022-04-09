import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:voting_dapp/models/candidate.dart';
import 'package:voting_dapp/models/voter_model.dart';
import 'package:voting_dapp/utils/constants.dart';
import 'package:web3dart/web3dart.dart';

//#region Main Function

//#region Load CONTRACT
Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = contract_address;

  final contract = DeployedContract(ContractAbi.fromJson(abi, 'ElectionSetu'),EthereumAddress.fromHex(contractAddress));

  return contract;
}
//#endregion

//#region This is Creation Function it's required key of Admin or User
Future<String> callFunction(String funcName, List<dynamic> args, Web3Client ethClient, String privateKey) async {

  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();

  final ethFunction = contract.function(funcName);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}

Future<String> callFunction1(String funcName, List<dynamic> args, String privateKey) async {
  var httpClient = Client();
  var ethClient = Web3Client(infura_url, httpClient);
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();

  final ethFunction = contract.function(funcName);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}
//#endregion

//#region To get the detail
Future<List<dynamic>> ask(String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}

Future<List<dynamic>> ask1(String funcName, List<dynamic> args) async {
  var httpClient = Client();
  var ethClient = Web3Client(infura_url, httpClient);
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}
//#endregion
//#endregion

//#region Functionality
//#region Start the Election
Future<String> startElection(String name, Web3Client ethClient) async {
  var response = await callFunction('startElection', [name], ethClient, owner_private_key);
  print('Election started successfully');
  return response;
}
//#endregion

//#region Add the Candidate
Future<String> addCandidate(String name, Web3Client ethClient) async {
  var response = await callFunction('addCandidate', [name], ethClient, owner_private_key);
  print('Candidate added successfully');
  return response;
}
//#endregion

//#region Authorize the Voter by taking Wallet address
Future<String> authorizeVoter(String address, Web3Client ethClient) async {
  var response = await callFunction('authorizeVoter',[EthereumAddress.fromHex(address)], ethClient, owner_private_key);
  print('Voter Authorized successfully');
  return response;
}
//#endregion

//#region Voter cast their vote
Future<String> vote(int candidateIndex, Web3Client ethClient,String privateKey) async {
  var response = await callFunction("vote", [BigInt.from(candidateIndex)], ethClient, privateKey);
  print("Vote counted successfully");
  return response;
}
//#endregion

//#region Get the total no. of Candidate
Future<List> getCandidatesNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumOfCandidate', [], ethClient);
  return result;
}
//#endregion

//#region Get the Total no. of Votes are cast
Future<List> getTotalVotes(Web3Client ethClient) async {
  List<dynamic> result = await ask('getTotalVotes', [], ethClient);
  return result;
}
//#endregion

//#region Get the total no. of Candidate
Future<List> getElectionNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumOfElection', [], ethClient);
  return result;
}
//#endregion

//#region Get the Candidate Info by taking index of the Candidate
Future<List> candidateInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('candidateInfo', [BigInt.from(index)], ethClient);
  return result;
}
//#endregion

//#region Get the Candidate Info by taking index of the Candidate
Future<List> electionInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('electionInfo', [BigInt.from(index)], ethClient);
  return result;
}
//#endregion
Future<VoterModel> getVoterInfoFromRemote(String address) async {
  print("Address >>> $address");
  /*Credentials credentials = EthPrivateKey.fromHex(address);
  var address1 = await credentials.extractAddress();*/
  List<dynamic> result = await ask1('voters', [EthereumAddress.fromHex(address)]);
  return VoterModel(result[0],result[1],result[2],result[3]);


}
Future<List<Candidate>> getAllCandidates() async {
  List<dynamic> result = await ask1('getCandidates', []);
  print(result);
  List<Candidate> candidates = [];
  for(var item in result){
    for(var candidate in item){

       candidates.add(Candidate(candidate[0], candidate[1]));
    }
  }
  print(candidates);
  return candidates;
}
//#endregion