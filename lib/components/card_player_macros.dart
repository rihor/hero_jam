import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/row_info.dart';
import 'package:hero_jam_2021/constants/typography.dart';

class PlayerMacrosCard extends StatelessWidget {
  const PlayerMacrosCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.white12,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Macros',
            style: TextStyleHeadingCardBold,
          ),
          SizedBox(height: 11),
          RowInfo(leading: 'Total de gols em campeonatos', trailing: '100'),
          RowInfo(leading: 'Total de gols em treinos', trailing: '200'),
          RowInfo(leading: 'Faltas', trailing: '10'),
          RowInfo(leading: 'Penaltis', trailing: 'X'),
        ],
      ),
    );
  }
}
