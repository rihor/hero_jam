import 'package:flutter/material.dart';
import 'package:hero_jam_2021/constants/typography.dart';

class PlayerMicrosCard extends StatelessWidget {
  const PlayerMicrosCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Micros',
            style: TextStyleHeadingCardBold,
          ),
          SizedBox(height: 11),
          Row(
            children: [
              Text('Domínio de bola'),
              Container(
                height: 20,
                width: 90,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('Resistência'),
              Container(
                height: 20,
                width: 208,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
