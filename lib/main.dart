import 'package:flutter/material.dart';
import 'package:hero_jam_2021/screens/game_screen.dart';
import 'package:hero_jam_2021/screens/games_screen.dart';
import 'package:hero_jam_2021/screens/login_screen.dart';
import 'package:hero_jam_2021/screens/main_page.dart';
import 'package:provider/provider.dart';

import 'helpers/utils.dart';
import 'providers/coach_model.dart';
import 'providers/players_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoachModel()),
        ChangeNotifierProvider(create: (_) => PlayersModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kickoff',
      initialRoute: '/login',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Montserrat',
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Montserrat',
            ),
        accentTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Montserrat',
            ),
      ),
      navigatorKey: Utils.mainAppNav,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainPage(),
        '/game': (context) => GameScreen(),
      },
    );
  }
}
