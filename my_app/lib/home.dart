import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_page_individual.dart';
import 'profile_page_corporation.dart';
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
  final String role;

  const HomeOtherAppPage({Key? key, required this.role}) : super(key: key);

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 169, 212, 230),
          leading: Image.asset(
            'assets/images/icon.jpeg',
            scale: 1,
          ),
          leadingWidth: 70,
          title: Container(
              // child:Image.asset('assets/images/top_bar.jpeg'),
              ),
          actions: [Image.asset('assets/images/options.jpeg')],
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_login.png"),
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
                            onTap: tmpFunction1,
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
                                    builder: (context) =>
                                        ProfileCorporationPage()));
                              }
                              // if (widget.role == "NGO") {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (context) => ProfileNGO()));
                              // }
                              if (widget.role == "Individual") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileIndividual()));
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
                            onTap: tmpFunction2,
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
        iconSize: 40,
        elevation: 5,
        fixedColor: Color.fromARGB(255, 13, 85, 126),
        backgroundColor: Color.fromARGB(255, 119, 177, 202),
      ),
    );
  }
}
