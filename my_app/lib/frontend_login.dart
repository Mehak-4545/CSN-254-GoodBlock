import 'package:flutter/material.dart';
import 'package:my_app/home_ngo.dart';
import 'package:my_app/main.dart';
import './frontend_signup_individual.dart';
import 'home.dart';
import 'profile_page_individual.dart';
import 'profile_page_corporation.dart';
import 'profile_page_ngo.dart';
import 'main.dart';
import 'main2.dart';
// import 'main.dart3';
// import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  final String role;

  const AuthPage({Key? key, required this.role}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    String input_name = "temp";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC6EAFA),
        // appBar: AppBar(title: Text('Goodblock')),
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_login.png"),
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
                        'Welcome back!',
                        style:
                            TextStyle(fontSize: 35, color: Color(0xff0d557e)),
                        // style:
                        // TextStyle(
                        //   // const color = const Color(0xffb74093);
                        //   // color: Colors.(Color(0xffb74093)),
                        //   fontSize: MediaQuery.of(context).size.width * 0.2,
                        //   fontWeight: FontWeight.bold,
                        //   // shadows: const [
                        //   //   // BoxShadow(
                        //   //   //   color: Colors.deepOrange,
                        //   //   //   offset: Offset(5, 10),
                        //   //   //   blurRadius: 10,
                        //   //   // ),
                        //   // ],
                        // ),
                      ),

                      Text(
                        'Enter your login credentials',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff0d557e)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          style: TextStyle(color: Color(0xff32637F)),
                          decoration: InputDecoration(
                            filled: false,
                            fillColor: Colors.blueGrey.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            hintText: 'User ID',
                            hintStyle: TextStyle(
                              color: Color(0xff32637F),
                            ),
                            icon: Icon(
                              Icons.mail_outline,
                              color: Color(0xff32637F),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              input_name = value;
                            });
                          },
                        ),
                      ),
                      const Divider(
                        color: Color(0xff0d557e),
                        height: 0,
                        // width: 300,
                        thickness: 2,
                        indent: 57,
                        endIndent: 55,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Color(0xff32637F)),
                          decoration: InputDecoration(
                            filled: false,
                            fillColor: Colors.blueGrey.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Color(0xff32637F),
                            ),
                            icon: Icon(
                              Icons.lock_outline,
                              color: Color(0xff32637F),
                            ),
                          ),
                        ),
                      ),

                      const Divider(
                        color: Color(0xff0d557e),
                        height: 0,
                        thickness: 2,
                        indent: 57,
                        endIndent: 55,
                      ),
                      //Button Container
                      // Container(
                      //   margin: EdgeInsets.all(25),
                      //   child: FlatButton(
                      //     child: Text('SignUp', style: TextStyle(fontSize: 20.0),),
                      //     onPressed: () {},
                      //   ),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      GestureDetector(
                        // onTap: () {},
                        onTap: () {
                          if (widget.role == "NGO") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeAppPage(
                                      role: widget.role,
                                      name: input_name,
                                    )));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeOtherAppPage(
                                      role: widget.role,
                                      name: input_name,
                                    )));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff32637F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(05),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87,
                                  offset: Offset(3, 3),
                                  blurRadius: 3,
                                )
                              ]),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 200,
                      ),
                      IconButton(
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back),
                        padding: const EdgeInsets.only(right: 250.0),
                        // alignment: Alignment.centerLeft,
                        iconSize: 48,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Launch()));
                        },
                      ),
                      // IconButton(
                      //   color: Colors.black,
                      //   icon: const Icon(Icons.arrow_forward),
                      //   padding: const EdgeInsets.only(right: 250.0),
                      //   // alignment: Alignment.centerLeft,
                      //   iconSize: 48,
                      //   onPressed: () {
                      //     if (widget.role == "NGO") {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => HomeAppPage(
                      //                 role: widget.role,
                      //               )));
                      //     } else {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => HomeOtherAppPage(
                      //                 role: widget.role,
                      //               )));
                      //     }
                      //   },
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
