import 'package:flutter/material.dart';
import 'package:hero_jam_2021/providers/coach_model.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:hero_jam_2021/screens/player_screen.dart';
import 'package:hero_jam_2021/screens/players_screen.dart';
import 'package:provider/provider.dart';

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
      // TODO: Create a Theme for the app
      theme: ThemeData.light().copyWith(),
      routes: {
        '/player': (context) => const PlayerScreen(),
        '/players': (context) => const PlayersScreen()
      },
    );
  }
}
