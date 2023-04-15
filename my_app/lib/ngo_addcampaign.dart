import 'package:flutter/material.dart';
import 'package:my_app/frontend_listing.dart';
import 'package:my_app/home_ngo.dart';
// import 'package:my_app/main.dart';
import './frontend_signup_individual.dart';
import 'home.dart';
import 'profile_page_individual.dart';
import 'profile_page_corporation.dart';
import 'profile_page_ngo.dart';
// import 'package:flutter/widgets.dart';

class AuthPage_addcampaign extends StatefulWidget {
  final String name, email, contact, address;

  const AuthPage_addcampaign(
      {Key? key,
      required this.name,
      required this.contact,
      required this.address,
      required this.email})
      : super(key: key);
  @override
  _AuthPage_addcampaignState createState() => _AuthPage_addcampaignState();
}

class _AuthPage_addcampaignState extends State<AuthPage_addcampaign> {
  @override
  Widget build(BuildContext context) {
    String input_campaignname = "cname",
        input_campaignmotto = "cmotto",
        input_targetamount = "tamount";
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
                        'List a Campaign:',
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff0d557e)),
                      ),
                      Text(
                        widget.name,
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff0d557e)),
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
                            hintText: 'Name of Campaign',
                            hintStyle: TextStyle(
                              color: Color(0xff32637F),
                            ),
                            icon: Icon(
                              Icons.people,
                              color: Color(0xff32637F),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              input_campaignname = value;
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
                            hintText: 'Campaign Motto',
                            hintStyle: TextStyle(
                              color: Color(0xff32637F),
                            ),
                            icon: Icon(
                              Icons.people,
                              color: Color(0xff32637F),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              input_campaignmotto = value;
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
                            hintText: 'Projected Target Amount',
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
                              input_targetamount = value;
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

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {},
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
                              builder: (context) => AuthPage_list(
                                    role: "NGO",
                                    name: widget.name,
                                    address: widget.address,
                                    email: widget.email,
                                    contact: widget.contact,
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
