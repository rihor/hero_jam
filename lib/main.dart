import 'package:flutter/material.dart';
import 'package:hero_jam_2021/providers/user_notifier.dart';
import 'package:provider/provider.dart';

import 'screens/first_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserModel(),
        ),
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
      initialRoute: '/',
      themeMode: ThemeMode.light,
      // TODO: Create a Theme for the app
      theme: ThemeData.light().copyWith(),
      routes: {'/': (context) => const FirstScreen()},
    );
  }
}
