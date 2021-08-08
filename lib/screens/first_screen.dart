import 'package:flutter/material.dart';
import 'package:hero_jam_2021/providers/coach_model.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<CoachModel>(context).getName() ??
            "don't have a name yet"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (String text) {
                Provider.of<CoachModel>(context, listen: false)
                    .changeName(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
