import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Player {
  late String id;
  String name;
  String position;
  AssetImage image;

  Player({required this.name, required this.position, required this.image}) {
    Uuid uuidGenerator = Uuid();

    this.id = uuidGenerator.v4();
  }
}

class PlayersModel extends ChangeNotifier {
  Player? _selectedPlayer;
  List<Player> players = [
    Player(
        name: 'Josélito',
        position: 'Atacante',
        image: AssetImage('images/atacante-13.png')),
    Player(
        name: 'Roberto',
        position: 'Atacante',
        image: AssetImage('images/atacante-12.png')),
    Player(
        name: 'Ryan',
        position: 'Atacante',
        image: AssetImage('images/atacante-11.png')),
    Player(
        name: 'Mateus',
        position: 'Atacante',
        image: AssetImage('images/atacante-10.png')),
    Player(
        name: 'Marcio Vitor',
        position: 'Atacante',
        image: AssetImage('images/atacante-9.png')),
    Player(
        name: 'Igor',
        position: 'Atacante',
        image: AssetImage('images/atacante-8.png')),
    Player(
        name: 'Ramon',
        position: 'Meio-campista',
        image: AssetImage('images/meio-campista-8.png')),
    Player(
        name: 'Pedro Almeida',
        position: 'Meio-campista',
        image: AssetImage('images/meio-campista-7.png')),
    Player(
        name: 'Figueiredo',
        position: 'Meio-campista',
        image: AssetImage('images/meio-campista-2.png')),
    Player(
        name: 'Luis Guilherme',
        position: 'Meio-campista',
        image: AssetImage('images/meio-campista-6.png')),
    Player(
        name: 'Ugo Voz',
        position: 'Meio-campista',
        image: AssetImage('images/meio-campista-5.png')),
    Player(
        name: 'Valdir',
        position: 'Meio-campista',
        image: AssetImage('images/meio-campista-4.png')),
    Player(
        name: 'Pedro',
        position: 'Lateral Direito',
        image: AssetImage('images/meio-campista-3.png')),
    Player(
        name: 'Walter',
        position: 'Lateral Esquerdo',
        image: AssetImage('images/meio-campista-1.png')),
    Player(
        name: 'Cuiabá',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-1.png')),
    Player(
        name: 'Vitor Reis',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-2.png')),
    Player(
        name: 'Fellipe',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-3.png')),
    Player(
        name: 'Nicollas',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-4.png')),
    Player(
        name: 'Carlos Eduardo',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-5.png')),
    Player(
        name: 'Pedro Santos',
        position: 'Goleiro',
        image: AssetImage('images/goleiro-3.png')),
    Player(
        name: 'Gabriel Altino',
        position: 'Goleiro',
        image: AssetImage('images/goleiro-2.png')),
    Player(
        name: 'Cesar',
        position: 'Goleiro',
        image: AssetImage('images/goleiro-1.png')),
  ];

  Player? getSelectedPlayer() {
    return _selectedPlayer;
  }

  void selectPlayer(String id) {
    _selectedPlayer = players.where((element) => element.id == id).first;
    notifyListeners();
  }

  List<Player> shufflePlayers() {
    final random = Random();

    // Go through all elements.
    for (var i = players.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = players[i];
      players[i] = players[n];
      players[n] = temp;
    }

    return players;
  }
}
