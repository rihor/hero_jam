import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/bottom_navigation.dart';
import 'package:hero_jam_2021/helpers/utils.dart';
import 'package:hero_jam_2021/screens/player_screen.dart';
import 'package:hero_jam_2021/screens/players_screen.dart';

import 'games_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D0D),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child: Navigator(
          key: Utils.bottomNav,
          initialRoute: '/players',
          onGenerateRoute: (RouteSettings settings) {
            Widget page;

            switch (settings.name) {
              case '/player':
                page = PlayerScreen();
                break;
              case '/games':
                page = GamesScreen();
                break;
              default:
                page = PlayersScreen();
                break;
            }

            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => page,
                transitionDuration: const Duration(seconds: 0));
          },
        ),
      ),
    );
  }
}
