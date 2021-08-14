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
            GoBackHeader(
              onGoBack: handleGoBack,
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
                                ListTile(
                                  title: Text('Avaliação física'),
                                  trailing: Text('12/09/21'),
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Text('Campeonato'),
                                  trailing: Text('12/09/21'),
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Text('Avaliação técnica'),
                                  trailing: Text('12/09/21'),
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Text('Avaliação física'),
                                  trailing: Text('12/09/21'),
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
            SizedBox(
              height: 30,
            ),
            RightAlignItem(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFA60512),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'NOVO RELATÓRIO',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

/**
    Expanded(
    child: Container(
    alignment: Alignment.center,
    child: TextButton(
    onPressed: () {},
    child: Text(
    'Ver mais',
    style: TextStyle(
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black87,
    ),
    ),
    ),
    ),
    ),
 */

/**

    Expanded(
    child: Container(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Histórico',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: Colors.black87,
    ),
    ),
    Expanded(
    child: ListView.builder(
    itemCount: 10,
    itemBuilder: (_, index) => ListTile(
    title: Text('Avaliação $index'),
    tileColor: Colors.amber,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
    ),
    Center(
    child: TextButton(
    onPressed: () {},
    child: Text(
    'Ver mais',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    color: Colors.black87,
    ),
    ),
    ),
    )
    ],
    ),
    ),
    ),
    SizedBox(
    width: 20,
    ),
    Placeholder(),


 */
