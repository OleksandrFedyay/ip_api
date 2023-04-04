import 'package:flutter/material.dart';
import 'package:ip_api/screens/ip_api_input_screen.dart';
import 'package:ip_api/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF241E44),
          appBarTheme: kAppBarTheme),
      home: const IpApiInputScreen(),
    );
    //  First screen where user enters the IP address
  }
}
