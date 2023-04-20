import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:my_app/contracts/address.dart';
import 'package:my_app/contracts/abi.dart';
import 'dart:async';

late DeployedContract ngoContract,
    individualContract,
    corporationContract,
    testContract;
final Map<String, DeployedContract> allContracts = {
  "ngo": ngoContract,
  "individual": individualContract,
  "corporation": corporationContract,
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
  httpClient = Client();
  client = Web3Client("https://testnet.aurora.dev/", httpClient);
}

Future<dynamic> callContractFunction(String contractName, String funcName,
    List<dynamic> parameter, String eventName) async {
  List toReturn = [];
  final contract = allContracts[contractName];
  final function = contract!.function(funcName);
  final transferEvent = contract.event(eventName);
  final targetEvent = contract.event(eventName);
  int done = 0;
  StreamSubscription<FilterEvent> sub = client
      .events(FilterOptions.events(contract: contract, event: targetEvent))
      .take(1)
      .listen((event) async {
    final decoded = transferEvent.decodeResults(event.topics!, event.data!);
    toReturn = decoded;
    done = 1;
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
      '/*Insert your private key here*/');
  final transactionHash = await client.sendTransaction(credentials, transaction,
      chainId: 1313161555);
  print(transactionHash);
  Future a = sub.asFuture();
  await a;
  return toReturn;
}

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
