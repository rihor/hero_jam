import 'package:flutter/material.dart';
import 'package:hero_jam_2021/providers/players_model.dart';

class PlayerDetailHeader extends StatelessWidget {
  final Player player;

  const PlayerDetailHeader({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Hero(
            tag: player.name,
            child: Image(
              image: player.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 54,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.name,
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
              ),
              Text(
                player.position,
                style: TextStyle(
                  fontSize: 36,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
