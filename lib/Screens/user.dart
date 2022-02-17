import 'package:flutter/material.dart';
import 'package:obiad/Screens/first.dart';
import 'package:obiad/Screens/login_screen.dart';
import 'package:obiad/Screens/new_user.dart';
import 'package:obiad/logic/login_provider.dart';
import 'package:provider/provider.dart';

class User extends StatelessWidget {
  User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLogin = Provider.of<LoginProvider>(
      context,
    ).isLogin;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 5.0,
              // ),
              const CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/02/24/01/30/cat-2093639_960_720.jpg'),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Container(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  enabled: !Provider.of<LoginProvider>(
                    context,
                  ).isLogin!,
                  decoration: InputDecoration(
                    label: Text('e-mail'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: 250,
                child: TextField(
                  enabled: !Provider.of<LoginProvider>(
                    context,
                  ).isLogin!,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('password'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              if (!Provider.of<LoginProvider>(
                context,
              ).isLogin!)
                ElevatedButton(
                    onPressed: () {
                      Provider.of<LoginProvider>(context, listen: false)
                          .isLogin = true;
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return First();
                      }));
                    },
                    child: Text('Zaloguj')),
              const SizedBox(
                height: 5.0,
              ),
              if (!Provider.of<LoginProvider>(
                context,
              ).isLogin!)
                MaterialButton(
                  textColor: Colors.blue,
                  onPressed: () {
                    Provider.of<LoginProvider>(context, listen: false)
                        .controller!
                        .jumpToPage(1);
                    // Provider.of<UserLog>(context, listen: false).currentIndex;
                  },
                  child: Text('Zarejestruj'),
                ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<LoginProvider>(context, listen: false).isLogin =
                      false;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  'Wyloguj',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
