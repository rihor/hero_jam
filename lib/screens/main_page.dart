import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/bottom_navigation.dart';
import 'package:hero_jam_2021/helpers/utils.dart';
import 'package:hero_jam_2021/screens/dashboard_screen.dart';
import 'package:hero_jam_2021/screens/player_screen.dart';
import 'package:hero_jam_2021/screens/players_screen.dart';

import 'game_screen.dart';
import 'games_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D0D),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child: HeroControllerScope(
          controller: MaterialApp.createMaterialHeroController(),
          child: Navigator(
            key: Utils.bottomNav,
            initialRoute: '/game',
            onGenerateRoute: (RouteSettings settings) {
              Widget page;

              switch (settings.name) {
                case '/dashboard':
                  page = DashboardScreen();
                  break;
                case '/player':
                  page = PlayerScreen();
                  break;
                case '/games':
                  page = GamesScreen();
                  break;
                case '/game':
                  page = GameScreen();
                  break;
                case '/players':
                default:
                  page = PlayersScreen();
                  break;
              }

              return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    final curveTween = CurveTween(curve: curve);

                    final tween =
                        Tween(begin: begin, end: end).chain(curveTween);

                    // final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                        position: animation.drive(tween), child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 500));
            },
          ),
        ),
      ),
    );
  }
}
