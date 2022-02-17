import 'package:flutter/material.dart';
import 'package:obiad/Screens/new_user.dart';
import 'package:obiad/Screens/user.dart';
import 'package:obiad/logic/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: Provider.of<LoginProvider>(context).controller,
        children: [
          User(),
          NewUser(),
        ],
      ),
    );
  }
}
