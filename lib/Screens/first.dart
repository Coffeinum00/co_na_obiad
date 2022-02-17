import 'package:flutter/material.dart';
import 'package:obiad/Screens/add.dart';
import 'package:obiad/Screens/new_user.dart';

import 'package:obiad/Screens/rotation.dart';
import 'package:obiad/Screens/user.dart';
import 'package:obiad/logic/first_provider.dart';
import 'package:provider/provider.dart';

// class First extends StatefulWidget {
//   const First({Key? key}) : super(key: key);

//   @override
//   State<First> createState() => _FirstState();
// }

class First extends StatelessWidget {
  First({Key? key}) : super(key: key);
  final List<Widget> screens = [
    Disc(),
    AddFood(),
    User(),
    const NewUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<FirstProvider>(context).currentIndex!,
        onTap: (index) {
          Provider.of<FirstProvider>(context, listen: false).currentIndex =
              index;
        },
        backgroundColor: Colors.teal[900],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            label: 'Losuj na dziś',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Dodaj, usuń dania',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_rounded),
            label: 'Twój profil',
          ),
        ],
      ),
      body: Container(
          child: screens[Provider.of<FirstProvider>(context).currentIndex!]),
    );
  }
}
