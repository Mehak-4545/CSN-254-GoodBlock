import 'package:flutter/material.dart';

import 'web3/interactor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initC();
  // await callContractFunction(
  //     "ngo", "_signup", ["c", "b", "b", "b", "b"], "_signup_event");
  // await callContractFunction("ngo", "_login", ["c", "b"], "_login_event");
  await callContractFunction("ngo", "_addCampaign",
      ["c", "doing something good", BigInt.from(20)], "_addCampaign_event");
  // await callContractFunction(
  //     "contractName", "_getAllNgos", [], "_getAllNgos_event");
}

// class GoodBlock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ,
//     );
//   }
// }

// class TestHome extends StatefulWidget {
//   const TestHome({super.key});

//   @override
//   State<TestHome> createState() => _TestHomeState();
// }

// class _TestHomeState extends State<TestHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }