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
  List<Player> players = [
    Player(
        name: 'Josélito',
        position: 'Atacante',
        image: AssetImage('/images/atacante-13')),
    Player(
        name: 'Roberto',
        position: 'Atacante',
        image: AssetImage('/images/atacante-12')),
    Player(
        name: 'Ryan',
        position: 'Atacante',
        image: AssetImage('/images/atacante-11')),
    Player(
        name: 'Mateus',
        position: 'Atacante',
        image: AssetImage('/images/atacante-10')),
    Player(
        name: 'Marcio Vitor',
        position: 'Atacante',
        image: AssetImage('/images/atacante-9')),
    Player(
        name: 'Igor',
        position: 'Atacante',
        image: AssetImage('/images/atacante-8')),
    Player(
        name: 'Ramon',
        position: 'Meio-campista',
        image: AssetImage('/images/meio-campista-8')),
    Player(
        name: 'Pedro Almeida',
        position: 'Meio-campista',
        image: AssetImage('/images/meio-campista-7')),
    Player(
        name: 'Figueiredo',
        position: 'Meio-campista',
        image: AssetImage('/images/meio-campista-2')),
    Player(
        name: 'Luis Guilherme',
        position: 'Meio-campista',
        image: AssetImage('/images/meio-campista-4')),
    Player(
        name: 'Ugo Voz',
        position: 'Meio Campo',
        image: AssetImage('images/meio-campista-3')),
    Player(
        name: 'Valdir',
        position: 'Meio Campo',
        image: AssetImage('images/meio-campista-3')),
    Player(
        name: 'Pedro',
        position: 'Lateral Direito',
        image: AssetImage('images/meio-campista-3')),
    Player(
        name: 'Walter',
        position: 'Lateral Esquerdo',
        image: AssetImage('images/meio-campista-3')),
    Player(
        name: 'Cuiabá',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-1')),
    Player(
        name: 'Vitor Reis',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-2')),
    Player(
        name: 'Fellipe',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-3')),
    Player(
        name: 'Nicollas',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-4')),
    Player(
        name: 'Carlos Eduardo',
        position: 'Zagueiro',
        image: AssetImage('images/zagueiro-5')),
    Player(
        name: 'Pedro Santos',
        position: 'Goleiro',
        image: AssetImage('images/goleiro-3')),
    Player(
        name: 'Gabriel Altino',
        position: 'Goleiro',
        image: AssetImage('images/goleiro-3')),
    Player(
        name: 'Cesar',
        position: 'Goleiro',
        image: AssetImage('images/goleiro-3')),
  ];

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
