import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/bottom_navigation.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Padding(
        padding: EdgeInsets.all(38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meus Jogadores',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 96,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/player');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Hero(
                              tag: Provider.of<PlayersModel>(context)
                                  .players[index]
                                  .name,
                              child: Image(
                                image: Provider.of<PlayersModel>(context)
                                    .players[index]
                                    .image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              Provider.of<PlayersModel>(context)
                                  .players[index]
                                  .name,
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: Provider.of<PlayersModel>(context).players.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 4 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  maxCrossAxisExtent: 800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
