import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_jam_2021/components/card_player_info.dart';
import 'package:hero_jam_2021/components/card_player_macros.dart';
import 'package:hero_jam_2021/components/card_player_micros.dart';
import 'package:hero_jam_2021/components/header_go_back.dart';
import 'package:hero_jam_2021/components/header_player_detail.dart';
import 'package:hero_jam_2021/components/right_align_item.dart';
import 'package:hero_jam_2021/helpers/utils.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Player? player = Provider.of<PlayersModel>(context).getSelectedPlayer();

    void handleGoBack() {
      Utils.bottomNav.currentState?.pop();
    }

    return Container(
      color: Color(0xFF0D0D0D),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoBackHeader(
                  onGoBack: handleGoBack,
                ),
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
                    'NOVO RELATÓRIO',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 38,
            ),
            player != null ? PlayerDetailHeader(player: player) : Container(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Histórico',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 200,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white12,
                                  ),
                                  child: ListTile(
                                    title: Text('Avaliação física'),
                                    trailing: Text('12/09/21'),
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white12,
                                  ),
                                  child: ListTile(
                                    title: Text('Campeonato'),
                                    trailing: Text('12/09/21'),
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white12,
                                  ),
                                  child: ListTile(
                                    title: Text('Avaliação técnica'),
                                    trailing: Text('12/09/21'),
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white12,
                                  ),
                                  child: ListTile(
                                    title: Text('Avaliação física'),
                                    trailing: Text('12/09/21'),
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ver mais',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        PlayerInfoCard(),
                        SizedBox(
                          height: 18,
                        ),
                        PlayerMacrosCard(),
                        SizedBox(
                          height: 18,
                        ),
                        PlayerMicrosCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
