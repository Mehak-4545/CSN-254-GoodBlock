import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:convert/convert.dart';
import 'package:my_app/contracts/address.dart';

// Replace these with your contract's ABI and address
const String contractAbi = """[
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_task",
				"type": "string"
			}
		],
		"name": "addTask",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "task",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "isDone",
						"type": "bool"
					}
				],
				"internalType": "struct Testcontract.Task",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "task",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "isDone",
						"type": "bool"
					}
				],
				"indexed": false,
				"internalType": "struct Testcontract.Task",
				"name": "_value",
				"type": "tuple"
			}
		],
		"name": "Test_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_taskIndex",
				"type": "uint256"
			},
			{
				"internalType": "bool",
				"name": "_status",
				"type": "bool"
			}
		],
		"name": "updateStatus",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_taskIndex",
				"type": "uint256"
			}
		],
		"name": "getTask",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "task",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "isDone",
						"type": "bool"
					}
				],
				"internalType": "struct Testcontract.Task",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "trial_func",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "pure",
		"type": "function"
	}
]"""; // ABI as a string
const String contractAddress =
    '0x07B2Da30288E1BF574F390A0C44ef08cDA4e4617'; // Address as a hex string

late DeployedContract ngoContract, individualContract, corporationContract;
final Map<String, DeployedContract> allContracts = {
  "ngo": ngoContract,
  "individual": individualContract,
  "corporation": corporationContract
};
late Client httpClient;
late Web3Client client;

void init() async {
  final ngoAbi = await rootBundle.loadString("../contracts/abi/ngo.json");
  final individualAbi =
      await rootBundle.loadString("../contracts/abi/individual.json");
  final corporationAbi =
      await rootBundle.loadString("../contracts/abi/corporation.json");
  ngoContract = DeployedContract(
    ContractAbi.fromJson(ngoAbi, ngo),
    EthereumAddress.fromHex(ngo),
  );
  corporationContract = DeployedContract(
    ContractAbi.fromJson(corporationAbi, corporation),
    EthereumAddress.fromHex(corporation),
  );
  individualContract = DeployedContract(
    ContractAbi.fromJson(individualAbi, individual),
    EthereumAddress.fromHex(individual),
  );
  httpClient = Client();
  client = Web3Client("https://testnet.aurora.dev/", httpClient);
}

Future<void> callContractFunction(String contractName, String funcName) async {
  // Encode the function call with its arguments
  final contract = allContracts[contractName];
  final function = contract!.function(funcName);
  final transferEvent = contract.event('${funcName}_event');
  client
      .events(FilterOptions.events(contract: contract, event: transferEvent))
      .take(1)
      .listen((event) {
    final decoded = transferEvent.decodeResults(event.topics!, event.data!);

    final from = decoded[0];

    print(
        '----------------------------------${from[0]}------------------------------------------');
  });
  // Get the current gas price
  final gasPrice = await client.getGasPrice();

  // Create the transaction to call the contract function
  final transaction = Transaction.callContract(
    contract: contract,
    function: function,
    parameters: ["gfdgsdrgtrgdersgt"],
    maxGas: 100000,
    gasPrice: gasPrice,
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

Future<void> main() async {
  // await callContractFunction();
}

// Future<dynamic> login(String email, String password) {
//   functionName 
//   return ;
// }
