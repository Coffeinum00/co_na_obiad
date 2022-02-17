import 'package:flutter/material.dart';
import 'package:obiad/Screens/first.dart';
import 'package:obiad/Screens/user.dart';
import 'package:obiad/logic/login_provider.dart';
import 'package:provider/provider.dart';

class NewUser extends StatelessWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/02/24/01/30/cat-2093639_960_720.jpg'),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Container(
                width: 250,
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Imię'),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
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
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('password'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return First();
                    }));
                  },
                  child: Text('Zarejestruj')),
              const SizedBox(
                height: 5.0,
              ),
              MaterialButton(
                textColor: Colors.blue,
                onPressed: () {
                  Provider.of<LoginProvider>(context, listen: false)
                      .controller!
                      .jumpToPage(0);
                },
                child: Text('Zaloguj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
