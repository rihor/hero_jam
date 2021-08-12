import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_jam_2021/components/bottom_navigation.dart';
import 'package:hero_jam_2021/components/card_player_info.dart';
import 'package:hero_jam_2021/components/card_player_macros.dart';
import 'package:hero_jam_2021/components/card_player_micros.dart';
import 'package:hero_jam_2021/components/header_go_back.dart';
import 'package:hero_jam_2021/components/header_player_detail.dart';
import 'package:hero_jam_2021/components/right_align_item.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Column(
          children: [
            GoBackHeader(),
            SizedBox(
              height: 38,
            ),
            PlayerDetailHeader(),
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
                                  tileColor: Colors.grey[200],
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
                                  tileColor: Colors.grey[200],
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
                                  tileColor: Colors.grey[200],
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
                                  tileColor: Colors.grey[200],
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
                              color: Colors.black87,
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

                  // Expanded(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         color: Colors.grey[200],
                  //         padding: EdgeInsets.all(15),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               'Perfil de Jogador',
                  //               style: TextStyle(
                  //                 fontSize: 36,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             Container(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Text('Altura'),
                  //                       SizedBox(
                  //                         width: 12,
                  //                       ),
                  //                       Text('173cm'),
                  //                     ],
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Text('Peso'),
                  //                       SizedBox(
                  //                         width: 12,
                  //                       ),
                  //                       Text('67kg'),
                  //                     ],
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Text('Posição principal'),
                  //                       SizedBox(
                  //                         width: 12,
                  //                       ),
                  //                       Text('Atacante'),
                  //                     ],
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Text('Posições secundárias'),
                  //                       SizedBox(
                  //                         width: 12,
                  //                       ),
                  //                       Text('Lateral direito, Zagueiro'),
                  //                     ],
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Text('Time dos sonhos'),
                  //                       SizedBox(
                  //                         width: 12,
                  //                       ),
                  //                       Text('Santos'),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         color: Colors.grey[200],
                  //         padding: EdgeInsets.all(15),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               'Macros',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 36,
                  //               ),
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     Text('Total de gols em campeonato'),
                  //                     Text('100')
                  //                   ],
                  //                 ),
                  //                 Row(
                  //                   children: [
                  //                     Text('Total de gols em treinos'),
                  //                     Text('200')
                  //                   ],
                  //                 ),
                  //                 Row(
                  //                   children: [Text('Faltas'), Text('10')],
                  //                 ),
                  //                 Row(
                  //                   children: [Text('Penaltis'), Text('0')],
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         color: Colors.grey[200],
                  //         child: Column(
                  //           children: [
                  //             Text(
                  //               'Micros',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 36,
                  //               ),
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     Text('Domínio de bola'),
                  //                     LinearProgressIndicator(
                  //                       backgroundColor: Colors.transparent,
                  //                       color: Color(0xFF03DAC5),
                  //                       value: 30,
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text('NOVO RELATÓRIO'),
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
