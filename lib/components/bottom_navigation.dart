import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF6200EE),
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Lista de Jogadores',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Meus jogos',
        )
      ],
    );
  }
}
