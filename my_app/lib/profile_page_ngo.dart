import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProfileNGO());
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

class ProfileNGO extends StatelessWidget {
  const ProfileNGO({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileNGOPage(),
    );
  }
}

class ProfileNGOPage extends StatefulWidget {
  const ProfileNGOPage({super.key});

  @override
  State<ProfileNGOPage> createState() => _ProfileNGOPageState();
}

class _ProfileNGOPageState extends State<ProfileNGOPage> {
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
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        // child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 190,
            ),
            Container(
              height: 500, //changed - yaha height set ki hai
              // color: const Color(0x00000000),
              // padding: const EdgeInsets.all(25),

              alignment: Alignment.center,
              child: SizedBox(
                height: 240,
                child: Card(
                    // color: Color.fromRGBO(186, 220, 235, 0),
                    color: Color(0xFFF0F4F5),
                    // elevation:6,
                    semanticContainer: true,
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        // Container(
                        //   height: 300,
                        //   // color: Color.fromRGBO(24,233, 111, 0.0),
                        // ),

                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Organization',
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Color(637176)),
                          style: GoogleFonts.notoSans(
                              color: Color.fromARGB(98, 42, 43, 62),
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ), //iski wajah se space dhang se ho rahi hai
                        Text(
                          'Email',
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Color(637176)),
                          style: GoogleFonts.notoSans(
                              color: Color.fromARGB(98, 42, 43, 62),
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Address',
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Color(637176)),
                          style: GoogleFonts.notoSans(
                              color: Color.fromARGB(98, 42, 43, 62),
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Contact number',
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Color(637176)),
                          style: GoogleFonts.notoSans(
                              color: Color.fromARGB(98, 42, 43, 62),
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Wallet',
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Color(637176)),
                          style: GoogleFonts.notoSans(
                              color: Color.fromARGB(98, 42, 43, 62),
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Ongoing campaign',
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Color(637176)),
                          style: GoogleFonts.notoSans(
                              color: Color.fromARGB(98, 42, 43, 62),
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
