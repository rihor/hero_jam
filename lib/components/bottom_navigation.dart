import 'package:flutter/material.dart';
import 'package:hero_jam_2021/helpers/utils.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF6200EE),
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      currentIndex: currentIndex,
      onTap: (int nextIndex) {
        if (nextIndex == 0) {
          Utils.bottomNav.currentState?.pushNamed('/players');
        } else {
          Utils.bottomNav.currentState?.pushNamed('/games');
        }

        setState(() {
          currentIndex = nextIndex;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            size: 30,
          ),
          label: 'Lista de Jogadores',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.app_registration,
            size: 30,
          ),
          label: 'Meus jogos',
        )
      ],
    );
  }
}
