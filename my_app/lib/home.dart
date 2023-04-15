import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/profile_page_ngo.dart';
import './frontend_login.dart';
import 'profile_page_individual.dart';
import 'profile_page_corporation.dart';
import 'main.dart';
import 'main2.dart';
import 'dummy.dart';
import 'about_us.dart';
import 'history.dart';
// import 'main3.dart';
import 'frontend_listing.dart';
// import 'main.dart';

// void main() {
//   runApp(const HomeOtherApp());
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

// void _onItemTapped(int index) {
//   if (index == 0) {
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => HomeAppPage(
//               role: widget.role,
//             )));
//   }
// }
// class HomeOtherApp extends StatelessWidget {
//   const HomeOtherApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'HomeOther App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeOtherAppPage(),
//     );
//   }
// }

class HomeOtherAppPage extends StatefulWidget {
  final String role, name;

  const HomeOtherAppPage({Key? key, required this.role, required this.name}) : super(key: key);

  @override
  State<HomeOtherAppPage> createState() => _HomeOtherAppPageState();
}

class _HomeOtherAppPageState extends State<HomeOtherAppPage> {
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

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_login1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          //child: Card(
          child: Container(
            // color: const Color(0xFFF9F9F9),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 195, // new change
                  // childAspectRatio:0.8;
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/final_quote2.jpeg'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 440,
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 0.8,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 50,
                        // height: 150,
                        // color:Color.fromARGB(255, 198, 234, 250),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AuthPage_list(role: widget.role, name: widget.name,)));
                            },
                            // onTap: tmpFunction1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/find.jpeg',
                                height: 150,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 50,
                        // color: Color.fromARGB(255, 198, 234, 250),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              if (widget.role == "Corporation") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AuthPage_history()));
                              }
                              if (widget.role == "Individual") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AuthPage_history()));
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/history.jpeg',
                                height: 150,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 50,
                        // color: Color.fromARGB(255, 198, 234, 250),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              if (widget.role == "Corporation") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AuthPage_aboutus()));
                              }
                              if (widget.role == "Individual") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AuthPage_aboutus()));
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/about_us.jpeg',
                                height: 150,
                                width: 50,
                              ),
                            ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: String.fromEnvironment('back'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: String.fromEnvironment('profile'),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AuthPage(role: widget.role)));
          }
          if (index == 1 && widget.role == "Corporation") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfileCorporationPage(name: widget.name,)));
          }
          if (index == 1 && widget.role == "Individual") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfileIndividualPage(name: widget.name,)));
          }

          // if (widget.role == "Individual") {
          //   Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => AuthPage_dummy()));
          // }
        },
        iconSize: 40,
        elevation: 5,
        fixedColor: Color.fromARGB(255, 13, 85, 126),
        backgroundColor: Color.fromARGB(255, 119, 177, 202),
      ),
    );
  }
}
