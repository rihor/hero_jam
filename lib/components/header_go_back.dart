import 'package:flutter/material.dart';

class GoBackHeader extends StatelessWidget {
  const GoBackHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.chevron_left),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(14),
          ),
        ),
        SizedBox(
          width: 32,
        ),
        Text(
          'VOLTAR PARA LISTA DE JOGADORES',
          style: TextStyle(
            letterSpacing: 3,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
