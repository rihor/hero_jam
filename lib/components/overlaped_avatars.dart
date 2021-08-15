import 'package:flutter/material.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class OverlapedAvatars extends StatelessWidget {
  const OverlapedAvatars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          final randomPlayer =
              Provider.of<PlayersModel>(context).shufflePlayers()[0];

          if (index == 5) {
            return Align(
              widthFactor: 0.8,
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white70,
                child: Text(
                  '+6',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }

          return Align(
            widthFactor: 0.8,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: randomPlayer.image,
              ),
            ),
          );
        },
      ),
    );
  }
}
