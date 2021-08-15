import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/overlaped_avatars.dart';
import 'package:hero_jam_2021/constants/typography.dart';
import 'package:hero_jam_2021/helpers/utils.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0D0D0D),
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 62),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jogos', style: TextStyleHeading),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDD1111),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Utils.mainAppNav.currentState?.pushNamed('/game');
                },
                icon: Icon(Icons.add),
                label: Text(
                  'NOVO JOGO',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OverlapedAvatars(),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'VS',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            OverlapedAvatars(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text('Jogo do dia 12/05/2021'),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
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
                        'JOGOS DE ONTEM',
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
            ),
          ),
        ],
      ),
    );
  }
}
