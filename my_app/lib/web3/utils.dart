import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
// import 'package:flutter/services.dart';

class Web3Interactor {
  Web3Interactor() {
    httpClient = Client();
    ethereumClient = Web3Client(
      "https://aurora-testnet.infura.io/v3/2dcb5659718143d49d488b502784a9b0",
      httpClient,
    );
  }

  late Client httpClient;
  late Web3Client ethereumClient;
  final EthPrivateKey credential = EthPrivateKey.fromHex('617bded8c194ba0e803cdb16959c2d6201174ea27f0a2957d523bf141a34b6e3');
  final String contractName = "Testcontract";

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await ethereumClient.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String> transaction(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    dynamic result = await ethereumClient.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );

    return result;
  }

  Future<DeployedContract> getContract() async {
    String abi = '''[
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
				"internalType": "uint256",
				"name": "a",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "senderadd",
				"type": "address"
			}
		],
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
	}
]''';
    String contractAddress = "0x83EdC4D1a750383e55E2d759bD65A8fA2a26067F";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }
}

void main() async {
  Web3Interactor web3Interactor = Web3Interactor();
  // List<dynamic> result = await web3Interactor.query("addTask", ["hello ji"]);
  var result = await web3Interactor.transaction("addTask", ["hello ji"]);
  print(result);
}
