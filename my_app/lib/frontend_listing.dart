import 'package:flutter/material.dart';
import 'package:my_app/profile_page_corporation.dart';
import 'package:my_app/profile_page_ngo.dart';
import 'package:my_app/web3/interactor.dart';
import './frontend_signup_individual.dart';
import 'package:google_fonts/google_fonts.dart';
import './home.dart';
import 'donate_page.dart';
import 'profile_page_individual.dart';

// import 'package:flutter/widgets.dart';

void tmpFunction3() {
  print('Funt corp');
}

class AuthPage_list extends StatefulWidget {
  final String role, name, email, contact, address;

  const AuthPage_list(
      {Key? key,
      required this.role,
      required this.name,
      required this.address,
      required this.contact,
      required this.email})
      : super(key: key);
  @override
  _AuthPage_listState createState() => _AuthPage_listState();
}

class _AuthPage_listState extends State<AuthPage_list> {
  var name_of_ngo = <String>[];
  var name_campaign = <String>[];
  var motto = <String>[];
  var email = <String>[];
  var contact = <String>[];
  var address = <String>[];

  List<String> ngo = [], camp = [], mo = [];

  @override
  void initState() async {
    List<List<String>> result = await callContractFunction(
        "ngo", "getAllCampaigns", [], "getAllCampaigns_event");
    List<String> campaigns = result[0];
    for (var campaign in campaigns) {
      name_of_ngo.add(campaign[0][4]);
      ngo.add(campaign[0][4]);
      email.add(campaign[0][5]);
      contact.add(campaign[0][6]);
      address.add(campaign[0][7]);
      name_campaign.add(campaign[0][0]);
      camp.add(campaign[0][0]);
      motto.add(campaign[0][1]);
      mo.add(campaign[0][1]);
    }
    super.initState();
  }

  void filterSearchResults(String name, String ngo_name, String goal) {
    setState(() {
      ngo = name_of_ngo
          .where((item) => item.toLowerCase().contains(name.toLowerCase()))
          .toList();
      ngo = name_of_ngo;
      camp = name_campaign
          .where((item) => item.toLowerCase().contains(ngo_name.toLowerCase()))
          .toList();
      mo = motto
          .where((item) => item.toLowerCase().contains(goal.toLowerCase()))
          .toList();
    });
  }

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

        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: String.fromEnvironment('back'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: String.fromEnvironment('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: String.fromEnvironment('profile'),
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeOtherAppPage(
                        role: widget.role,
                        name: widget.name,
                        contact: widget.contact,
                        address: widget.address,
                        email: widget.email,
                      )));
            }
            if (index == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeOtherAppPage(
                        role: widget.role,
                        name: widget.name,
                        contact: widget.contact,
                        address: widget.address,
                        email: widget.email,
                      )));
            }
            if (index == 2 && widget.role == "Individual") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileIndividualPage(
                        name: widget.name,
                        email: widget.email,
                        address: widget.address,
                        contact: widget.contact,
                      )));
            }
            if (index == 2 && widget.role == "Corporation") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileCorporationPage(
                        name: widget.name,
                        contact: widget.contact,
                        address: widget.address,
                        email: widget.email,
                      )));
            }
            // if (widget.role == "Individual") {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => AuthPage_dummy()));
            // }
          },
          iconSize: 40,
          elevation: 5,
          fixedColor: const Color.fromARGB(255, 13, 85, 126),
          backgroundColor: const Color(0xff77b1ca),
        ),
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
              const SizedBox(
                height: 120,
              ),
              Container(
                // new change
                alignment: AlignmentDirectional.topCenter,
                // childAspectRatio:0.8;
                child: Container(
                  height: 50,
                  width: 320,
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      // onTap: tmpFunction2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            filterSearchResults(value, "CareIndia",
                                "Empower women and girls from poor and marginalised communities");
                          },
                          // onEditingComplete: () => tmpFunction3(),
                          decoration: InputDecoration(
                            hintText: '  Search For NGOs',
                            hintStyle: TextStyle(
                              color: Color(0xff32637F),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: ListView.builder(
                      itemCount: name_campaign.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 330,
                          // top: 20,
                          // height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF0F4F5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 130,
                              child: Flex(
                                direction: Axis
                                    .horizontal, // arrange children horizontally
                                children: [
                                  Expanded(
                                    flex:
                                        1, // take up 2/3 of the available space
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      alignment: AlignmentDirectional.topCenter,
                                      child: Image.asset(
                                        'assets/images/ngo.png',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:
                                        4, // take up 1/3 of the available space
                                    child: Column(
                                      children: [
                                        SizedBox(height: 11),
                                        Text(
                                          '${name_campaign[index]},                                             ',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.notoSans(
                                            color: Color(0xFFDB473E),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          '${name_of_ngo[index]}',
                                          style: GoogleFonts.notoSans(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '${motto[index]}',
                                          style: GoogleFonts.notoSans(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),

                                        // SizedBox(height: 12),

                                        // SizedBox(height: 20),

                                        new Expanded(
                                            child: Flex(
                                          direction: Axis.horizontal,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: TextButton(
                                                onPressed: () {
                                                  {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProfileNGOPage(
                                                                  name:
                                                                      '${name_of_ngo[index]}',
                                                                  contact:
                                                                      contact[
                                                                          index],
                                                                  email: email[
                                                                      index],
                                                                  address:
                                                                      address[
                                                                          index],
                                                                )));
                                                  }
                                                },
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    ProfileNGO(
                                                                      name:
                                                                          '${name_of_ngo[index]}',
                                                                      contact:
                                                                          contact[
                                                                              index],
                                                                      email: email[
                                                                          index],
                                                                      address:
                                                                          address[
                                                                              index],
                                                                    )));
                                                  },
                                                  child: Text(
                                                    "Contact us",
                                                    style: TextStyle(
                                                      color: Color(0xff000000),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AuthPage_donate(
                                                                name_of_ngo:
                                                                    '${name_of_ngo[index]}',
                                                                name_of_corporation:
                                                                    widget.name,
                                                                role:
                                                                    widget.role,
                                                                self_address:
                                                                    widget
                                                                        .address,
                                                                self_contact:
                                                                    widget
                                                                        .contact,
                                                                self_email:
                                                                    widget
                                                                        .email,
                                                              )));
                                                },
                                                child: Container(
                                                  height: 27,
                                                  width: 105,
                                                  padding: EdgeInsets.all(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff32637F),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black87,
                                                          offset: Offset(3, 3),
                                                          blurRadius: 3,
                                                        )
                                                      ]),
                                                  child: Center(
                                                    child: Text('Donate',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: 330,
              //   // top: 20,
              //   // height: 100,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Color(0xFFF0F4F5),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: SizedBox(
              //       height: 130,
              //       child: Flex(
              //         direction:
              //             Axis.horizontal, // arrange children horizontally
              //         children: [
              //           Expanded(
              //             flex: 1, // take up 2/3 of the available space
              //             child: Container(
              //               padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              //               alignment: AlignmentDirectional.topCenter,
              //               child: Image.asset(
              //                 'assets/images/ngo.png',
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             flex: 4, // take up 1/3 of the available space
              //             child: Column(
              //               children: [
              //                 SizedBox(height: 11),
              //                 Text(
              //                   'Care India                                                ',
              //                   textAlign: TextAlign.left,
              //                   style: GoogleFonts.notoSans(
              //                     color: Color(0xFFDB473E),
              //                     fontSize: 17,
              //                     fontWeight: FontWeight.w900,
              //                   ),
              //                 ),
              //                 Text(
              //                   'Empower women and girls from poor and marginalised communities',
              //                   style: GoogleFonts.notoSans(
              //                       color: Color(0xFF000000),
              //                       fontSize: 12,
              //                       fontWeight: FontWeight.w500),
              //                 ),

              //                 // SizedBox(height: 12),

              //                 // SizedBox(height: 20),

              //                 new Expanded(
              //                     child: Flex(
              //                   direction: Axis.horizontal,
              //                   children: [
              //                     Expanded(
              //                       flex: 1,
              //                       child: TextButton(
              //                         onPressed: () {
              //                           {
              //                             Navigator.of(context).push(
              //                                 MaterialPageRoute(
              //                                     builder: (context) =>
              //                                         ProfileNGOPage(
              //                                             name: "Care India")));
              //                           }
              //                         },
              //                         child: TextButton(
              //                           onPressed: () {
              //                             Navigator.of(context).push(
              //                                 MaterialPageRoute(
              //                                     builder: (context) =>
              //                                         ProfileNGO(
              //                                           name: "Care India",
              //                                         )));
              //                           },
              //                           child: Text(
              //                             "Contact us",
              //                             style: TextStyle(
              //                               color: Color(0xff000000),
              //                               fontSize: 12,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                     Expanded(
              //                       flex: 1,
              //                       child: TextButton(
              //                         onPressed: () {
              //                           Navigator.of(context).push(
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       AuthPage_donate(
              //                                         name_of_ngo: "Care India",
              //                                         name_of_corporation:
              //                                             widget.name,
              //                                         role: widget.role,
              //                                       )));
              //                         },
              //                         child: Container(
              //                           height: 27,
              //                           width: 105,
              //                           padding: EdgeInsets.all(
              //                             MediaQuery.of(context).size.width *
              //                                 0.02,
              //                           ),
              //                           decoration: BoxDecoration(
              //                               color: Color(0xff32637F),
              //                               borderRadius: BorderRadius.all(
              //                                 Radius.circular(15),
              //                               ),
              //                               boxShadow: [
              //                                 BoxShadow(
              //                                   color: Colors.black87,
              //                                   offset: Offset(3, 3),
              //                                   blurRadius: 3,
              //                                 )
              //                               ]),
              //                           child: Center(
              //                             child: Text('Donate',
              //                                 style: GoogleFonts.notoSans(
              //                                     color: Color(0xFFFFFFFF),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w500)),
              //                           ),
              //                         ),
              //                       ),
              //                     )
              //                   ],
              //                 )),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.arrow_back),
      //       label: String.fromEnvironment('home'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
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
      //   backgroundColor: Color.fromARGB(255, 119, 177, 202),
      // ),
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
