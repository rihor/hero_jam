import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hero_jam_2021/constants/typography.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0D0D0D),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá professor',
              style: TextStyleHeading2,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'João Marcos',
              style: TextStyleHeading,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Seus próximos treinos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nivel Iniciante',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Chip(
                              label: Text(
                                'ESCOLINHA ARENA STELLA MARIS',
                                style: TextStyleChip,
                              ),
                            ),
                            Row(
                              children: [
                                Chip(
                                  label: Text('SEG', style: TextStyleChip),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Chip(
                                  label: Text('QUA', style: TextStyleChip),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  '14:00 - 15:00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_outline),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('25 alunos'),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'VER MAIS',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFDD1111),
                                minimumSize: Size(120, 50),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  if (index != 0 && index % 2 == 0) {
                    return Row(
                      children: [
                        Expanded(
                          child: new Container(
                            margin: EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: Colors.white38,
                              height: 60,
                              thickness: 1,
                            ),
                          ),
                        ),
                        Text(
                          'TREINOS DE AMANHÃ',
                          style: TextStyle(
                            color: Color(0xFF8b8b8b),
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Expanded(
                          child: new Container(
                            margin: EdgeInsets.only(left: 15.0, right: 10.0),
                            child: Divider(
                              color: Colors.white38,
                              height: 60,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return SizedBox(
                    height: 32,
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
