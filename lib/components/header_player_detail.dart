import 'package:flutter/material.dart';

class PlayerDetailHeader extends StatelessWidget {
  const PlayerDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Placeholder(
          fallbackHeight: 300,
          fallbackWidth: 400,
        ),
        SizedBox(
          width: 54,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'João Marcelo',
                style: TextStyle(
                  fontSize: 96,
                  letterSpacing: -1.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Atacante',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
