import 'package:flutter/material.dart';
import './frontend_signup_individual.dart';
import 'package:google_fonts/google_fonts.dart';

import 'donate_page.dart';

// import 'package:flutter/widgets.dart';

void tmpFunction3() {
  print('Funt corp');
}

class AuthPage_aboutus extends StatefulWidget {
  @override
  _AuthPage_aboutusState createState() => _AuthPage_aboutusState();
}

class _AuthPage_aboutusState extends State<AuthPage_aboutus> {
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

          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.red.shade500.withOpacity(0.8),
                //       Colors.blueGrey.shade900.withOpacity(0.8),
                //       Colors.white.withOpacity(0.2),
                //     ],
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //   ),
                // ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Image.asset('assets/images/bg_login.png',
                      //     height: 100, width: 100),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.1,
                        height: 200,
                      ),
                      Text(
                        'The vision of GoodBlock',
                        style:
                            TextStyle(fontSize: 35, color: Color(0xff0d557e)),
                        
                      ),


                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),


                      Text(
                        'Building a new world, one block at a time!',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff0d557e)),
                        
                      ),
                      Text(
                        'GoodBlock is an application that connects various NGOs accross the world to  Corporations and Individuals who wish to donate for a cause,  ',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff0d557e)),
                        
                      ),
                      
                      
                      
                    ],
                  ),
                ),
              ),
            ],
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
