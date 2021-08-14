import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/coach_model.dart';
import 'providers/players_model.dart';
import 'screens/GamesScreen.dart';
import 'screens/player_screen.dart';
import 'screens/players_screen.dart';

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
      title: 'Flutter Demo',
      initialRoute: '/players',
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(),
      routes: {
        '/player': (context) => const PlayerScreen(),
        '/players': (context) => const PlayersScreen(),
        '/games': (context) => const GamesScreen(),
      },
    );
  }
}
