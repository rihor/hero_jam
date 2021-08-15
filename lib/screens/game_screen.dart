import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/game_field.dart';
import 'package:hero_jam_2021/constants/typography.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<PlayersModel>(context).shufflePlayers();
    return Container(
      color: Color(0xFF0D0D0D),
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 62),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jogo',
            style: TextStyleHeading,
          ),
          SizedBox(
            height: 10,
          ),
          GameField(players: players),
        ],
      ),
    );
  }
}
