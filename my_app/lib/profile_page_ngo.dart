import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const ProfileNGO());
// }

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
  final String name, contact, address, email;
  const ProfileNGO(
      {super.key,
      required this.name,
      required this.contact,
      required this.address,
      required this.email});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileNGOPage(
        name: name,
        contact: contact,
        address: address,
        email: email,
      ),
    );
  }
}

class ProfileNGOPage extends StatefulWidget {
  final String name, contact, address, email;
  const ProfileNGOPage(
      {super.key,
      required this.name,
      required this.contact,
      required this.address,
      required this.email});

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
              height: 250,
            ),
            Container(
              height: 500, //changed - yaha height set ki hai
              // color: const Color(0x00000000),
              // padding: const EdgeInsets.all(25),

              alignment: Alignment.center,
              child: SizedBox(
                height: 300,
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
                          height: 40,
                        ),
                        Text(
                          'Organization: ' + widget.name,
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
                          'Email: ' + widget.email,
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
                          'Address: ' + widget.address,
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
                          'Contact number: ' + widget.contact,
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
