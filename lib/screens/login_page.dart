import 'package:flutter/material.dart';
import 'package:hero_jam_2021/helpers/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Utils.mainAppNav.currentState?.pushNamed('/main');
          },
          child: Text('Kickoff'),
        ),
      ),
    );
  }
}
