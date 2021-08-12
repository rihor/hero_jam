import 'package:flutter/material.dart';
import 'package:hero_jam_2021/constants/typography.dart';

class RowInfo extends StatelessWidget {
  final String leading;
  final String trailing;

  RowInfo({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leading,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(trailing, style: TextStyleSmallBold),
      ],
    );
  }
}
