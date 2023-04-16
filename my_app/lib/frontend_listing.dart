import 'package:flutter/material.dart';
import 'package:my_app/profile_page_corporation.dart';
import 'package:my_app/profile_page_ngo.dart';
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
  final String role;
  final String name;

  const AuthPage_list({Key? key, required this.role, required this.name})
      : super(key: key);
  @override
  _AuthPage_listState createState() => _AuthPage_listState();
}

class _AuthPage_listState extends State<AuthPage_list> {
  final List<String> name_of_ngo = <String>[];
  final List<String> name_campaign = <String>[];
  final List<String> motto = <String>[];
  var ngo = <String>[];
  var camp = <String>[];
  var mo = <String>[];
  var ngo_all = <String>[];
  var camp_all = <String>[];
  var mo_all = <String>[];

  @override
  void initState() async {
    List<List<String>> result = await callContractFunction(
        "ngo", "getAllCampaigns", [], "getAllCampaigns_event");
    List<String> campaigns = result[0];
    for (var campaign in campaigns) {
      ngo_all.add(campaign[0][4]);
      ngo.add(campaign[0][4]);
      contact.add(campaign[0][6]);
      address.add(campaign[0][7]);
      name_campaign.add(campaign[0][0]);
      camp.add(campaign[0][0]);
      motto.add(campaign[0][1]);
      mo.add(campaign[0][1]);
    }
    super.initState();
  }

  void filterSearchResults(String cam_name) {
    setState(() {
      // ngo = name_of_ngo
      //     .where((item) => item.toLowerCase().contains(name.toLowerCase()))
      //     .toList();
      camp = name_campaign
          .where((item) => item.toLowerCase().contains(cam_name.toLowerCase()))
          .toList();
      int ind;

      for (var i = 0; i < name_campaign.length; i++) {
        if (name_campaign[i].contains(cam_name)) {
          ind = i;
          ngo_all.add(name_of_ngo[ind]);
          // .toList();
          mo_all.add(motto[ind]);
        }
      }
      ngo = ngo_all.toList();
      mo = mo_all.toList();
      ngo_all.clear();
      mo_all.clear();
      // mo = motto
      //     .where((item) => item.toLowerCase().contains(goal.toLowerCase()))
      //     .toList();
    });
    // setState(() {
    //   // ngo.clear();
    //   var ind = -1;
    //   for (var i = 0; i < ngo.length; i++) {
    //     if (ngo[i] == name) ind = i;
    //   }
    //   if (ind == -1) {
    //     camp.clear();
    //     ngo.clear();
    //     mo.clear();
    //   } else {
    //     var cam_name = camp[ind];
    //     var goal = mo[ind];
    //     ngo.clear();
    //     ngo.add(name);
    //     camp.clear();
    //     camp.add(cam_name);
    //     mo.clear();
    //     mo.add(goal);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return
        // SafeArea(
        //   child:
        Scaffold(
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
                    )));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeOtherAppPage(
                      role: widget.role,
                      name: widget.name,
                    )));
          }
          if (index == 2 && widget.role == "Individual") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ProfileIndividualPage(name: widget.name)));
          }
          if (index == 2 && widget.role == "Corporation") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileCorporationPage(
                      name: widget.name,
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
        height: 1000,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_login3.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 120,
            ),
            Card(
              // color: Color(0xFFF0F4F5),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                // child: Padding(
                // padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xFFF0F4F5),
                      labelText: "Search",
                      hintText: "Search for NGOs",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
                // ),
              ),
            ),
            // Container(
            //     // new change
            //     alignment: AlignmentDirectional.topCenter,
            //     // childAspectRatio:0.8;
            //     child: Container(
            //       height: 50,
            //       width: 320,
            //       child: Card(
            //         elevation: 20,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20)),
            //         child: GestureDetector(
            //           // onTap: tmpFunction2,
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: TextField(

            //               textAlignVertical: TextAlignVertical.center,
            //               onChanged: (value) {
            //                 filterSearchResults(value, "CareIndia",
            //                     "Empower women and girls from poor and marginalised communities");
            //               },
            //               // onEditingComplete: () => tmpFunction3(),
            //               decoration: InputDecoration(
            //                 hintText: '  Search For NGOs',
            //                 hintStyle: TextStyle(
            //                   color: Color(0xff32637F),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),

            // new change

            SizedBox(
              height: 10,
            ),
            Container(
              child: Expanded(
                  child: ListView.builder(
                      itemCount: camp.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                width: 340,
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
                                            padding: EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            alignment:
                                                AlignmentDirectional.topCenter,
                                            child: Image.asset(
                                              'assets/images/ngo.png',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex:
                                              4, // take up 1/3 of the available space
                                          child: Column(
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 11),
                                              Text(
                                                '${camp[index]}                                                           ',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.notoSans(
                                                  color: Color(0xFFDB473E),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              // SizedBox(height: 11),
                                              Text(
                                                '${ngo[index]}                                                                                              ',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.notoSans(
                                                    color: Color.fromARGB(
                                                        255, 105, 21, 35),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${mo[index]}',
                                                style: GoogleFonts.notoSans(
                                                    color: Color(0xFF000000),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                                              '${ngo[index]}')));
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
                                                                                '${ngo[index]}',
                                                                          )));
                                                        },
                                                        child: Text(
                                                          "Contact us",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff000000),
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
                                                                builder:
                                                                    (context) =>
                                                                        AuthPage_donate(
                                                                          name_of_ngo:
                                                                              '${ngo[index]}',
                                                                          name_of_corporation:
                                                                              widget.name,
                                                                          role:
                                                                              widget.role,
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
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xff32637F),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          15),
                                                                ),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black87,
                                                                offset: Offset(
                                                                    3, 3),
                                                                blurRadius: 3,
                                                              )
                                                            ]),
                                                        child: Center(
                                                          child: Text('Donate',
                                                              style: GoogleFonts.notoSans(
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      })),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      // ),

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
