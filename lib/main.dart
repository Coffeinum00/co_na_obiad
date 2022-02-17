import 'package:flutter/material.dart';
import 'package:obiad/Screens/first.dart';
import 'package:obiad/Screens/login_screen.dart';
import 'package:obiad/logic/login_provider.dart';
import 'package:obiad/logic/random_provider.dart';
import 'package:provider/provider.dart';

import 'logic/first_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => FirstProvider()),
        ChangeNotifierProvider(
          create: (_) => RandomProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Co dziś na obiad?',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
