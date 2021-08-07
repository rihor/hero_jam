import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hero_jam_2021/providers/user_notifier.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<UserModel>(context).getName() ??
            "don't have a name yet"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (String text) {
                Provider.of<UserModel>(context, listen: false).changeName(text);
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  Position? positionCaught =
                      await Provider.of<UserModel>(context, listen: false)
                          .updateLocation();
                  print(positionCaught);
                },
                child: Text('Pegar posição'))
          ],
        ),
      ),
    );
  }
}
