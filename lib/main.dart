import 'package:flutter/material.dart';
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
      themeMode: ThemeMode.light,
      theme: ThemeData.dark().copyWith(),
      navigatorKey: Utils.mainAppNav,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainPage(),
        // '/player': (context) => const PlayerScreen(),
        // '/players': (context) => const PlayersScreen(),
        // '/games': (context) => const GamesScreen(),
      },
    );
  }
}
