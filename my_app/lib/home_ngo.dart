import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/profile_page_individual.dart';
import 'package:my_app/profile_page_corporation.dart';
import 'package:my_app/profile_page_ngo.dart';
import 'package:my_app/dummy.dart';
import './frontend_login.dart';
import 'package:my_app/ngo_addcampaign.dart';
import 'package:my_app/frontend_listing.dart';
import 'package:my_app/about_us.dart';
import 'package:my_app/history.dart';
// import 'main.dart';

// void main() {
//   runApp(const HomeApp());
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

// class HomeApp extends StatelessWidget {
//   final String role;

//   const HomeApp({Key? key, required this.role}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Home App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeAppPage(),
//     );
//   }
// }

class HomeAppPage extends StatefulWidget {
  final String role, name, contact, email, address;

  const HomeAppPage(
      {Key? key,
      required this.role,
      required this.name,
      required this.contact,
      required this.address,
      required this.email})
      : super(key: key);

  @override
  State<HomeAppPage> createState() => _HomeAppPageState();
}

class _HomeAppPageState extends State<HomeAppPage> {
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
                        height: 145,
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
                                  builder: (context) => (AuthPage_addcampaign(
                                        name: widget.name,
                                        contact: widget.contact,
                                        address: widget.address,
                                        email: widget.email,
                                      ))));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/add_camp_new.png',
                                height: 160,
                                width: 60,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AuthPage_history()));
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AuthPage_aboutus()));
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
            label: String.fromEnvironment('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: String.fromEnvironment('home'),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AuthPage(role: widget.role)));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileNGO(
                      name: widget.name,
                      contact: widget.contact,
                      email: widget.email,
                      address: widget.address,
                    )));
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
