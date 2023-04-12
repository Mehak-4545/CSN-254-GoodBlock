import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'main.dart';

void main() {
  runApp(const SampleApp());
}

void tmpFunction1() {
  print('Funt ngo');
}

void tmpFunction2() {
  print('Funt indv');
}

void tmpFunction3() {
  print('Funt corp');
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
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
      body:SingleChildScrollView(
          //child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(// new change
                  alignment:AlignmentDirectional.topCenter,
                  // childAspectRatio:0.8;
                  child: Container(
                    height: 50,
                    width: 320,
                    child:Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: 
                    
                    GestureDetector(
                            // onTap: tmpFunction2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: TextFormField(
                                initialValue: "   Search for NGOs",
                                
                                textAlignVertical: TextAlignVertical.center,
                                onEditingComplete: () => tmpFunction3(),),
                            ),
                          ),
                  ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 330,
                  
                  color: Color(0xFFF0F4F5),
                child:ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                  height: 200,
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 0.75,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    
                    children: [
                     Align(// new change
                  alignment:AlignmentDirectional.topCenter, child:Image.asset(
            'assets/images/campaign.png',),),
            Column(
              children: [
                           Text(' SEEDS', style: GoogleFonts.notoSans(
                        color: Color(0xFFDB473E),
                        fontSize: 17,
                        fontWeight: FontWeight.w900),),
                      Text('Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 ', style: GoogleFonts.notoSans(
                        color: Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                        ),
              ],
            )
                    ],),),),
            //     child:Container(
            //       width: 330,
                  
            //       color: Color(0xFFF0F4F5),
            //     child:Text.rich(
                
            //       TextSpan(
                    
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //         children: [
            //           // TextSpan(text: 'This text has an '),
            //           WidgetSpan(
            //             child:  Image.asset(
            // 'assets/images/campaign.png',),
            //           ),
            //           WidgetSpan(
            //             child: Column(
            //             children: <Widget>[
            //           Text(' SEEDS', style: GoogleFonts.notoSans(
            //             color: Color(0xFFDB473E),
            //             fontSize: 17,
            //             fontWeight: FontWeight.w900),),
            //           Text('Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 Mek100 ', style: GoogleFonts.notoSans(
            //             color: Color(0xFF000000),
            //             fontSize: 12,
            //             fontWeight: FontWeight.w500),
            //             ),
            //             ],
            //             ),
            //             ),
            //         ],
            //       ),
            //     ),),
            ),
              ],
            
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
