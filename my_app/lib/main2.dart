import 'package:flutter/material.dart';
import './frontend_login.dart';
import './frontend_signup_ngo.dart';
import './frontend_signup_corp.dart';
import './frontend_signup_individual.dart';
import './frontend_listing.dart';

void main() {
  runApp(GoodBlock());
}

class GoodBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AuthPage(),
      // home: AuthPage_corp(),
      // home: AuthPage_indi(),
      // home: AuthPage_ngo(),
      home: AuthPage_list(),
    );
  }
}
