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
      backgroundColor: Color(0xFFF2F2F2),
      fixedColor: Color(0xFFA60512),
      unselectedItemColor: Color(0xFF0D0D0D),
      currentIndex: currentIndex,
      onTap: (int nextIndex) {
        if (currentIndex == nextIndex) {
          return;
        }

        switch (nextIndex) {
          case 0:
            Utils.bottomNav.currentState?.pushNamed('/dashboard');
            break;
          case 1:
            Utils.bottomNav.currentState?.pushNamed('/players');
            break;
          case 2:
            Utils.bottomNav.currentState?.pushNamed('/games');
        }

        setState(() {
          currentIndex = nextIndex;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
            size: 30,
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            size: 30,
          ),
          label: 'Lista de jogadores',
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
