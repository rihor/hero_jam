import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/row_info.dart';
import 'package:hero_jam_2021/constants/typography.dart';

class PlayerInfoCard extends StatelessWidget {
  const PlayerInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Color(0xFFFCFCFC),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perfil de Jogador',
            style: TextStyleHeadingCardBold,
          ),
          SizedBox(height: 11),
          RowInfo(leading: 'Altura', trailing: '173 cm'),
          RowInfo(leading: 'Peso', trailing: '67 kg'),
          RowInfo(leading: 'Posição principal', trailing: 'Atacante'),
          RowInfo(leading: 'Posições secundárias', trailing: 'Lateral direito'),
          RowInfo(leading: 'Time dos sonhos', trailing: 'Santos'),
        ],
      ),
    );
  }
}
