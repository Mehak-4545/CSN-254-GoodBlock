import 'package:flutter/material.dart';
import './frontend_signup_individual.dart';
import 'package:google_fonts/google_fonts.dart';

import 'donate_page.dart';

// import 'package:flutter/widgets.dart';

void tmpFunction3() {
  print('Funt corp');
}

class AuthPage_dummy extends StatefulWidget {
  @override
  _AuthPage_dummyState createState() => _AuthPage_dummyState();
}

class _AuthPage_dummyState extends State<AuthPage_dummy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC6EAFA),
        // appBar: AppBar(title: Text('Goodblock')),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(70),
        //   child: AppBar(
        //     backgroundColor: Color.fromARGB(255, 169, 212, 230),
        //     // leading: Image.asset(
        //     //   'assets/images/icon.jpeg',
        //     //   scale: 1,
        //     // ),
        //     leadingWidth: 70,
        //     title: Container(
        //         // child:Image.asset('assets/images/top_bar.jpeg'),
        //         ),
        //     actions: [Image.asset('assets/images/ham_bg.jpg')],
        //   ),
        // ),

        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_login3.png"),
              fit: BoxFit.fill,
            ),
          ),

          
        ),
      ),
    );

    // bottomNavigationBar:
    // BottomNavigationBar(
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.arrow_back),
    //       label: String.fromEnvironment('home'),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       label: String.fromEnvironment('home'),
    //     ),
    //   ],
    //   iconSize: 40,
    //   elevation: 5,
    //   fixedColor: Color.fromARGB(255, 13, 85, 126),
    //   backgroundColor: Color(0xff77b1ca),
    // );
  }
}
