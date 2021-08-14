import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/bottom_navigation.dart';
import 'package:hero_jam_2021/components/game_field.dart';
import 'package:hero_jam_2021/components/player_circle.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Padding(
        padding: EdgeInsets.all(38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jogo',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 96,
              ),
            ),
            GameField(),
          ],
        ),
      ),
    );
  }
}
