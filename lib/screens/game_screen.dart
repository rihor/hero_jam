import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/game_field.dart';
import 'package:hero_jam_2021/constants/typography.dart';
import 'package:hero_jam_2021/helpers/utils.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<PlayersModel>(context).shufflePlayers();
    return Scaffold(
      body: Container(
        color: Color(0xFF0D0D0D),
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Utils.mainAppNav.currentState?.pop();
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black87,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF2F2F2),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Text(
                  'LISTA DE JOGOS',
                  style: TextStyle(
                    letterSpacing: 3,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
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
      ),
    );
  }
}
