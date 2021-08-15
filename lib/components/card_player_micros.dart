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
              Container(
                width: 155,
                child: Text('Domínio de bola'),
              ),
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
              Container(
                width: 155,
                child: Text('Resistência'),
              ),
              Container(
                height: 20,
                width: 140,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 155,
                child: Text('Eficiência de passes'),
              ),
              Container(
                height: 20,
                width: 25,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 155,
                child: Text('Dribles efetivos'),
              ),
              Container(
                height: 20,
                width: 130,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 155,
                child: Text('Tomada de bola'),
              ),
              Container(
                height: 20,
                width: 80,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
