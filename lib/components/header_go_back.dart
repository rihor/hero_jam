import 'package:flutter/material.dart';

class GoBackHeader extends StatelessWidget {
  final void Function() onGoBack;

  const GoBackHeader({Key? key, required this.onGoBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onGoBack,
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
          'LISTA DE JOGADORES',
          style: TextStyle(
            letterSpacing: 3,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            fontFamily: 'Montserrat',
          ),
        )
      ],
    );
  }
}
