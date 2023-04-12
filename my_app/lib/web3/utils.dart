import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
// import 'package:flutter/services.dart';

class Web3Interactor {
  Web3Interactor() {
    httpClient = Client();
    ethereumClient = Web3Client(
      "https://testnet.aurora.dev/",
      httpClient,
    );
  }

  late Client httpClient;
  late Web3Client ethereumClient;
  final EthPrivateKey credential = EthPrivateKey.fromHex(
      '617bded8c194ba0e803cdb16959c2d6201174ea27f0a2957d523bf141a34b6e3');
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
      // fetchChainIdFromNetworkId: true,
      chainId: 1313161555,
    );
    print(result);
    final transaction = await ethereumClient.getTransactionByHash(result.toString());
    print(transaction);
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
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "_value",
				"type": "uint256"
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
	}
]''';
    String contractAddress = "0x2f9b57232494EAc37bAE0050deBeCd95674c95FD";

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
  // final transaction = await Web3Interactor.getTransaction(transactionHash);
}
