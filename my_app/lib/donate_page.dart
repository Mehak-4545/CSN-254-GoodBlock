import 'package:flutter/material.dart';
import 'package:my_app/frontend_listing.dart';
import 'package:my_app/home_ngo.dart';
// import 'package:my_app/main.dart';
import './frontend_signup_individual.dart';
import 'home.dart';
import 'profile_page_individual.dart';
import 'profile_page_corporation.dart';
import 'profile_page_ngo.dart';
import 'thankyou.dart';

// import 'package:flutter/widgets.dart';
void tmpFunction2() {
  print('Funt indv');
}

class AuthPage_donate extends StatefulWidget {
  final String name_of_ngo, name_of_corporation, role; //name of NGO

  const AuthPage_donate(
      {Key? key,
      required this.name_of_ngo,
      required this.name_of_corporation,
      required this.role})
      : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage_donate> {
  @override
  Widget build(BuildContext context) {
    String input_ngo_name = "ngo_name", input_amount = "amt";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC6EAFA),
        // appBar: AppBar(title: Text('Goodblock')),
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_login4.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
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
                        'Donate to:',
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff0d557e)),
                      ),

                      Text(
                        widget.name_of_ngo,
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff0d557e)),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                      // const Divider(
                      //   color: Color(0xff0d557e),
                      //   height: 0,
                      //   // width: 300,
                      //   thickness: 2,
                      //   indent: 57,
                      //   endIndent: 55,
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          obscureText: false,
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
                            hintText: 'Amount to be donated',
                            hintStyle: TextStyle(
                              color: Color(0xff32637F),
                            ),
                            icon: Icon(
                              Icons.money_rounded,
                              color: Color(0xff32637F),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              input_amount = value;
                            });
                          },
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
                        // onTap: () {
                        //   tmpFunction();
                        // },
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AuthPage_thankyou(
                                    name_of_ngo: widget.name_of_ngo,
                                    name_of_corporation:
                                        widget.name_of_corporation,
                                    role: widget.role,
                                  )));
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
                              'Donate',
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
                        height: 330,
                      ),
                      IconButton(
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back),
                        padding: const EdgeInsets.only(right: 250.0),
                        // alignment: Alignment.centerLeft,
                        iconSize: 48,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AuthPage_list(
                                    role: widget.role,
                                    name: widget.name_of_ngo,
                                  )));
                        },
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
  }
}
