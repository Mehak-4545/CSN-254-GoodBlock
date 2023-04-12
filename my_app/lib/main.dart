import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/frontend_signup_corp.dart';
import './frontend_signup_ngo.dart';
import './frontend_signup_individual.dart';
// import 'main.dart';

void main() {
  runApp(const Launch());
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

class Launch extends StatelessWidget {
  const Launch({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaunchPage(),
    );
  }
}

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
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
      backgroundColor: Color.fromARGB(255, 198, 234, 250),
      // appBar: AppBar(
      //   title: const Text('Shinjan'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          //child: Card(
          child: Container(
            // color: const Color(0xFFF9F9F9),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 350, // new change
                  child: Image.asset('assets/images/logofinal.jpeg'),
                ),
                SizedBox(
                  child: Text(
                    'GOODBLOCK',
                    // style: TextStyle(color: Color(637176)),
                    style: GoogleFonts.megrim(
                        color: Color.fromARGB(98, 42, 43, 62),
                        fontSize: 50,
                        fontWeight: FontWeight.w900),
                    // foreground: Paint()
                    //     ..style = PaintingStyle.stroke
                    //     ..strokeWidth = 6
                    //     ..color =Color.fromARGB(98, 42, 43, 62),
                  ),
                  height: 55,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Text(
                    'Who are you?',
                    // style: TextStyle(color: Colors.black.withOpacity(1.0)),
                    style: GoogleFonts.notoSans(
                        color: Color.fromRGBO(0, 1, 3, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  height: 25,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 440,
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 0.75,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    children: [
                      Container(
                        height: 200,
                        child: Card(
                          elevation: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AuthPage_ngo()));
                            },
                            child: Image.asset('assets/images/ngo.jpeg',
                                width: 30, height: 200),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Card(
                          elevation: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AuthPage_corp()));
                            },
                            child: Image.asset('assets/images/corporation.jpeg',
                                width: 30, height: 200),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Card(
                          elevation: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AuthPage_indi()));
                            },
                            child: Image.asset('assets/images/individual.jpeg',
                                width: 30, height: 200),
                          ),
                        ),
                      ),
                      // const Text("He'd have you all unravel at the"),
                      // const Text('Sound of screams but the'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
    //   body:ListView(
    //      SizedBox(
    //             child:Image.asset('assets/images/logo.jpeg'),
    //             width: 300, 
    //             height: 100,
    //         ),
    //              // <-- SEE HERE
    //         // Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
    //         SizedBox(
    //             child: Text(
    //           'GOODBLOCK',
    //           // style: TextStyle(color: Color(637176)),
    //           style: GoogleFonts.megrim(
    //               color: Color.fromARGB(98, 42, 43, 62),
    //               fontSize: 50,
    //               fontWeight: FontWeight.bold),
    //         ),
    //         height: 75,
    //         ),
    //         SizedBox(
    //           child:Text(
    //           'Who are you?',
    //           // style: TextStyle(color: Colors.black.withOpacity(1.0)),
    //           style: GoogleFonts.notoSans(
    //               color: Color.fromRGBO(0, 1, 3, 1),
    //               fontSize: 12,
    //               fontWeight: FontWeight.bold),
    //         ),
    //         height: 25,),
    //         SizedBox(
    //           child: GridView.count(
    //           primary: false,
    //           padding: const EdgeInsets.all(20),
    //           crossAxisCount: 3,
    //           children: <Widget>[
    //               Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
    //               // const Text("He'd have you all unravel at the"),
    //               Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
                  
    //               Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
    //               // const Text('Sound of screams but the'),
                
    //           ],
    //         ),
    //         ),
    //   )

    // );
//   }
// }

// void main() {
//   runApp(GoodBlock());
// }

// class GoodBlock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const TestHome(),
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
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sample Code'),
//       ),
//       body: Column(
//         children: [
//           Image.asset('logo.svg'), // <-- SEE HERE
//           RichText(
//             text: TextSpan(
//               text: 'GOODBLOCK',
//               // style: TextStyle(color: Color(637176)),
//               style: GoogleFonts.megrim(color: Color.fromARGB(98, 42, 43, 62)),
//               children: const <TextSpan>[
//                 TextSpan(
//                     text: 'bold',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 50,
//                     )),
//               ],
//             ),
//           ),
//           RichText(
//             text: TextSpan(
//               text: 'Who are you?',
//               // style: TextStyle(color: Colors.black.withOpacity(1.0)),
//               style:
//                   GoogleFonts.notoSans(color: Color.fromARGB(13, 32, 44, 81)),
//               children: const <TextSpan>[
//                 TextSpan(
//                     text: 'bold',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     )),
//               ],
//             ),
//           ),
//           GridView.count(
//             primary: false,
//             padding: const EdgeInsets.all(20),
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             crossAxisCount: 3,
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 // color: Colors.teal[100],
//                 child: Image.asset('CORPORATIONbutton.svg'),
//                 // const Text("He'd have you all unravel at the"),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 // color: Colors.teal[200],
//                 child: Image.asset('CORPORATIONbutton.svg'),
//                 // const Text('Heed not the rabble'),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 // color: Colors.teal[300],
//                 child: Image.asset('CORPORATIONbutton.svg'),
//                 // const Text('Sound of screams but the'),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//       // body: Center(
//       //   child: SingleChildScrollView(
//       //     child:Column(
//       //       children:<Widget>[
//       //       SizedBox(
//       //           child:Image.asset('assets/images/logo.jpeg'),
//       //           width: 300, 
//       //           height: 100,
//       //       ),
//       //            // <-- SEE HERE
//       //       // Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
//       //       SizedBox(
//       //           child: Text(
//       //         'GOODBLOCK',
//       //         // style: TextStyle(color: Color(637176)),
//       //         style: GoogleFonts.megrim(
//       //             color: Color.fromARGB(98, 42, 43, 62),
//       //             fontSize: 50,
//       //             fontWeight: FontWeight.bold),
//       //       ),
//       //       height: 75,
//       //       ),
//       //       SizedBox(
//       //         child:Text(
//       //         'Who are you?',
//       //         // style: TextStyle(color: Colors.black.withOpacity(1.0)),
//       //         style: GoogleFonts.notoSans(
//       //             color: Color.fromRGBO(0, 1, 3, 1),
//       //             fontSize: 12,
//       //             fontWeight: FontWeight.bold),
//       //       ),
//       //       height: 25,),
//       //       SizedBox(
//       //         child: GridView.count(
//       //         primary: false,
//       //         padding: const EdgeInsets.all(20),
//       //         crossAxisCount: 3,
//       //         children: <Widget>[
//       //             Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
//       //             // const Text("He'd have you all unravel at the"),
//       //             Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
                  
//       //             Image.asset('assets/images/corporation.jpeg',width: 300, height: 100),
//       //             // const Text('Sound of screams but the'),
                
//       //         ],
//       //       ),
//       //       ),
//       //       ],
//       //   ),
//       // ),
//     // ),