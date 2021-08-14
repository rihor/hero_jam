import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/bottom_navigation.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(38),
        child: Column(
          children: [
            Text(
              'Meus Jogadores',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 96,
              ),
            ),
            GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: [],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
