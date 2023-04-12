import 'package:flutter/material.dart';
import './frontend_signup_individual.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter/widgets.dart';

void tmpFunction3() {
  print('Funt corp');
}

class AuthPage_list extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage_list> {
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
              label: String.fromEnvironment('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: String.fromEnvironment('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: String.fromEnvironment('home'),
            ),
          ],
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
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          onEditingComplete: () => tmpFunction3(),
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
                      direction:
                          Axis.horizontal, // arrange children horizontally
                      children: [
                        Expanded(
                          flex: 1, // take up 2/3 of the available space
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            alignment: AlignmentDirectional.topCenter,
                            child: Image.asset(
                              'assets/images/ngo.png',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4, // take up 1/3 of the available space
                          child: Column(
                            children: [
                              SizedBox(height: 11),
                              Text(
                                'SEEDS                                                ',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.notoSans(
                                  color: Color(0xFFDB473E),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Disaster preparedness, disaster response and rehabilitating homes and community infrastructure',
                                style: GoogleFonts.notoSans(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),

                              // SizedBox(height: 12),

                              // SizedBox(height: 20),
                              TextButton(
                                child: Text(
                                  "Contact us",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                      direction:
                          Axis.horizontal, // arrange children horizontally
                      children: [
                        Expanded(
                          flex: 1, // take up 2/3 of the available space
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            alignment: AlignmentDirectional.topCenter,
                            child: Image.asset(
                              'assets/images/ngo.png',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4, // take up 1/3 of the available space
                          child: Column(
                            children: [
                              SizedBox(height: 11),
                              Text(
                                'Pratham                                                ',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.notoSans(
                                  color: Color(0xFFDB473E),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Quality education for underprivileged children in India and providing them with necessary knowledge and support.',
                                style: GoogleFonts.notoSans(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),

                              // SizedBox(height: 12),

                              // SizedBox(height: 20),
                              TextButton(
                                child: Text(
                                  "Contact us",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                      direction:
                          Axis.horizontal, // arrange children horizontally
                      children: [
                        Expanded(
                          flex: 1, // take up 2/3 of the available space
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            alignment: AlignmentDirectional.topCenter,
                            child: Image.asset(
                              'assets/images/ngo.png',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4, // take up 1/3 of the available space
                          child: Column(
                            children: [
                              SizedBox(height: 11),
                              Text(
                                'Care India                                                ',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.notoSans(
                                  color: Color(0xFFDB473E),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Empower women and girls from poor and marginalised communities',
                                style: GoogleFonts.notoSans(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),

                              // SizedBox(height: 12),

                              // SizedBox(height: 20),
                              TextButton(
                                child: Text(
                                  "Contact us",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                        style: GoogleFonts.notoSans(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),

              // Container(
              //   width: 330,
              //   // top: 20,
              //   height: 30,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Color(0xFF32637F),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: SizedBox(
              //       height: 130,
              //     ),
              //   ),
              // ),
            ],

            //Navbar
            //       bottomNavigationBar: BottomNavigationBar(
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
