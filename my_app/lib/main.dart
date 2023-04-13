import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SampleApp());
					}

void tmpFunction1() {
  print('Funt ngo');
			}

void tmpFunction2() {
  print('Funt indv');
			}

void tmpFunction3() {
  print('Funt corp');
			}
		],
		"name": "Corporations",
		"outputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "Address",
				"type": "string"
			}
	}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text.
  String textToShow = 'I Like Flutter';

  void _updateText() {
    setState(() {
      // Update the text.
      textToShow = 'Flutter is Awesome!';
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 10, 63, 86) ,
      // backgroundColor: Color.fromARGB(255, 198, 234, 250) ,
      backgroundColor: Color.fromARGB(255, 198, 234, 250),
      appBar: AppBar(
        title: const Text('GoodBlock'),
      ),
      body: Container(
          // constraints: BoxConstraints.expand(),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/profile_bg.png"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          // child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 190,
          ),
          // Container(
          //   height: 500, //changed - yaha height set ki hai
          //   // color: const Color(0x00000000),
          //   // padding: const EdgeInsets.all(25),

          //   alignment: Alignment.center,
          //   child: SizedBox(
          //     child: Card(
          //         // color: Color.fromRGBO(186, 220, 235, 0),
          //         // color: Color(0xFFF0F4F5),
          //         // elevation:6,
          //         semanticContainer: true,
          //         // clipBehavior: Clip.antiAliasWithSaveLayer,
          //         child: Column(
          //           children: [
          // Container(
          //   height: 300,
          //   // color: Color.fromRGBO(24,233, 111, 0.0),
          // ),
          SizedBox(
            height: 50,
          ),
          Text(
            "DONATE TO:",
            // style:
            // color: Color.fromARGB(98, 42, 43, 62),
            // fontSize: 20,
            // fontWeight: FontWeight.w900,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "SEEDS",
            // style: GoogleFonts.megrim(
            //   color: Color.fromARGB(97, 80, 6, 39),
            //   fontSize: 20,
            //   fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 200,
            child: TextField(
            decoration: new InputDecoration(labelText: "Enter the amount"),
            keyboardType: TextInputType.number,
            // Only numbers can be entered
          ),
          ),
        ],
      )),
  );
    //       ),
    //     ],),
    //   ),
  // );
}
}
