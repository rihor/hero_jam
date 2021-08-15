import 'package:flutter/material.dart';
import 'package:hero_jam_2021/helpers/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D0D),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/kickoff_logo.png'),
            ),
            Image(
              image: AssetImage('images/kickoff_logo2.png'),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              width: 500,
              child: Form(
                key: Utils.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          letterSpacing: 3,
                          color: Colors.grey,
                        ),
                      ),
                      maxLines: 1,
                      autofocus: false,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          letterSpacing: 3,
                          color: Colors.grey,
                        ),
                      ),
                      maxLines: 1,
                      autofocus: false,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (Utils.formKey.currentState!.validate()) {
                          Utils.mainAppNav.currentState?.pushNamed('/main');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF20505),
                        padding: EdgeInsets.all(25),
                        textStyle: TextStyle(
                          letterSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('ENTRAR'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          padding: EdgeInsets.all(24),
                          side: BorderSide(
                            width: 1,
                            color: Color(0xFFF20505),
                          )),
                      onPressed: () {},
                      child: Text(
                        'AINDA NÃO SOU ESCOLINHA',
                        style: TextStyle(
                          color: Color(0xFFF20505),
                          letterSpacing: 3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
