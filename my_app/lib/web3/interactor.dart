import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:convert/convert.dart';
import 'package:my_app/contracts/address.dart';
import 'package:my_app/contracts/abi.dart';

const String contractAddress =
    '0x07B2Da30288E1BF574F390A0C44ef08cDA4e4617'; // Address as a hex string

late DeployedContract ngoContract,
    individualContract,
    corporationContract,
    testContract;
final Map<String, DeployedContract> allContracts = {
  "ngo": ngoContract,
  "individual": individualContract,
  "corporation": corporationContract,
  "test": testContract
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
  testContract = DeployedContract(
      ContractAbi.fromJson(testAbi, test), EthereumAddress.fromHex(test));
  httpClient = Client();
  client = Web3Client("https://testnet.aurora.dev/", httpClient);
}

Future<dynamic> callContractFunction(
    String contractName, String funcName, List parameter) async {
  // Encode the function call with its arguments
  final contract = allContracts[contractName];
  final function = contract!.function(funcName);
  final transferEvent = contract.event('${funcName}_event');
  client
      .events(FilterOptions.events(contract: contract, event: transferEvent))
      .take(1)
      .listen((event) {
    final decoded = transferEvent.decodeResults(event.topics!, event.data!);

    final from = decoded;
    print(
        '----------------------------------${from[0]}------------------------------------------');
  });

  // Create the transaction to call the contract function
  final transaction = Transaction.callContract(
    contract: contract,
    function: function,
    parameters: parameter,
    maxGas: 100000,
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
  dynamic receipt = await client.getTransactionReceipt(transactionHash);
  print(receipt);
  while (receipt == null) {
    receipt = await client.getTransactionReceipt(transactionHash);
  }

  print("Receipt : ");
  print(receipt);
  print("Receipt over");

  // Decode the return value of the contract function
  dynamic info = await client.getTransactionByHash(transactionHash);
  print('Return value: ${receipt}');
}

void main() async {
  // await callContractFunction();
  await ngo_signup("Tanmay", "email.com", "vava", "2341", "erwr");
}

Future<dynamic> ngo_login(String userName, String password) {
  String functionName = "_login";
  String contractName = "ngo";
  List parameter = [userName, password];
  return callContractFunction(functionName, contractName, parameter);
}

Future<dynamic> ngo_signup(String userName, String email, String password,
    String contact, String address) {
  String functionName = "_signup";
  String contractName = "ngo";
  List parameter = [userName, email, password, contact, address];
  print("ngo signed in");
  return callContractFunction(functionName, contractName, parameter);
}
