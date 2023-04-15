// import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:my_app/contracts/address.dart';
import 'package:my_app/contracts/abi.dart';
import 'package:my_app/contracts/address.dart';
import 'dart:async';

late DeployedContract ngoContract,
    individualContract,
    corporationContract,
    testContract;
final Map<String, DeployedContract> allContracts = {
  "ngo": ngoContract,
  "individual": individualContract,
  "corporation": corporationContract,
  // "test": testContract
};
late Client httpClient;
late Web3Client client;

void initC() async {
  ngoContract = DeployedContract(
    ContractAbi.fromJson(ngoAbi, ngo),
    EthereumAddress.fromHex(ngo),
  );
  corporationContract = DeployedContract(
    ContractAbi.fromJson(corporateAbi, corporation),
    EthereumAddress.fromHex(corporation),
  );
  individualContract = DeployedContract(
    ContractAbi.fromJson(individualAbi, individual),
    EthereumAddress.fromHex(individual),
  );
  // testContract = DeployedContract(
  //     ContractAbi.fromJson(testAbi, test), EthereumAddress.fromHex(test));
  httpClient = Client();
  client = Web3Client("https://testnet.aurora.dev/", httpClient);
}

Future<dynamic> callContractFunction(String contractName, String funcName,
    List<dynamic> parameter, String eventName) async {
  // Encode the function call with its arguments
  final contract = allContracts[contractName];
  final function = contract!.function(funcName);
  final transferEvent = contract.event(eventName);
  // Get the current gas price
  // final gasPrice = await client.getGasPrice();
  final targetEvent = contract.event(eventName);

  StreamSubscription<FilterEvent> sub = client
      .events(FilterOptions.events(contract: contract, event: targetEvent))
      .take(1)
      .listen((event) async {
    final decoded = transferEvent.decodeResults(event.topics!, event.data!);
    print("=================");
    print(decoded);
    print("==================");
    return;
  });

  // Create the transaction to call the contract function
  final transaction = Transaction.callContract(
    contract: contract,
    function: function,
    parameters: parameter,
    maxGas: 3000000,
    value: EtherAmount.zero(),
  );

  // Sign and send the transaction
  final credentials = EthPrivateKey.fromHex(
      '617bded8c194ba0e803cdb16959c2d6201174ea27f0a2957d523bf141a34b6e3');
  // final signedTransaction = await client.signTransaction(
  //   credentials,
  //   transaction,
  //   chainId: 1313161555, // Chain ID of the Aurora testnet
  // );
  final transactionHash = await client.sendTransaction(credentials, transaction,
      chainId: 1313161555);
  print(transactionHash);
  // Wait for the transaction to be mined
  // dynamic receipt = await client.getTransactionReceipt(transactionHash);
  // print(receipt);
  // while (receipt == null) {
  //   receipt = await client.getTransactionReceipt(transactionHash);
  // }

  // print("Receipt : ");
  // print(receipt);
  // print("Receipt over");

  // // Decode the return value of the contract function
  // dynamic info = await client.getTransactionByHash(transactionHash);
  // print('Return value: ${receipt}');
}

// void main() async {
//   await initV();
//   // await callContractFunction();
//   dynamic a = await ngo_signup("Tanmay", "email.com", "vava", "2341", "erwr");
//   print('----------------------------------');
//   print(a);
//   print("====================================");
// }

Future<dynamic> ngo_login(String userName, String password) {
  String functionName = "_login";
  String contractName = "ngo";
  List<String> parameter = [userName, password];
  return callContractFunction(
      contractName, functionName, parameter, "_login_event");
}

Future<dynamic> ngo_signup(String userName, String email, String password,
    String contact, String address) async {
  String functionName = "_signup";
  String contractName = "ngo";
  List<String> parameter = [userName, email, password, contact, address];
  print("ngo signed in");
  dynamic val = await callContractFunction(
      contractName, functionName, parameter, "_createNgo_event");
  print("call done");
  return val;
}
