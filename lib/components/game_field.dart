import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/player_circle.dart';
import 'package:hero_jam_2021/providers/players_model.dart';
import 'package:provider/provider.dart';

class GameField extends StatefulWidget {
  final List<Player> players;

  @override
  _GameFieldState createState() => _GameFieldState();

  const GameField({required this.players});
}

class _GameFieldState extends State<GameField> {
  late GameController _controller;
  //374
  @override
  void initState() {
    super.initState();
    final players = widget.players;
    _controller = GameController(
      players: <GamePlayer>[
        GamePlayer(
            position: Offset(297.5, -30),
            team: Team.orange,
            player: players[0]),
        GamePlayer(
            position: Offset(150, 130), team: Team.orange, player: players[1]),
        GamePlayer(
            position: Offset(297.5, 130),
            team: Team.orange,
            player: players[2]),
        GamePlayer(
            position: Offset(445, 130), team: Team.orange, player: players[3]),
        GamePlayer(
            position: Offset(230, 340), team: Team.orange, player: players[4]),
        GamePlayer(
            position: Offset(365, 340), team: Team.orange, player: players[5]),
        GamePlayer(
            position: Offset(100, 450), team: Team.orange, player: players[6]),
        GamePlayer(
            position: Offset(495, 450), team: Team.orange, player: players[7]),
        GamePlayer(
            position: Offset(80, 675), team: Team.orange, player: players[8]),
        GamePlayer(
            position: Offset(515, 675), team: Team.orange, player: players[9]),
        GamePlayer(
            position: Offset(297.5, 700),
            team: Team.orange,
            player: players[10]),
        GamePlayer(
            position: Offset(297.5, 778), team: Team.pink, player: players[11]),
        GamePlayer(
            position: Offset(150, 618), team: Team.pink, player: players[12]),
        GamePlayer(
            position: Offset(297.5, 618), team: Team.pink, player: players[13]),
        GamePlayer(
            position: Offset(445, 618), team: Team.pink, player: players[14]),
        GamePlayer(
            position: Offset(230, 408), team: Team.pink, player: players[15]),
        GamePlayer(
            position: Offset(365, 408), team: Team.pink, player: players[16]),
        GamePlayer(
            position: Offset(100, 298), team: Team.pink, player: players[17]),
        GamePlayer(
            position: Offset(495, 298), team: Team.pink, player: players[18]),
        GamePlayer(
            position: Offset(80, 73), team: Team.pink, player: players[19]),
        GamePlayer(
            position: Offset(515, 73), team: Team.pink, player: players[20]),
        GamePlayer(
            position: Offset(297.5, 48), team: Team.pink, player: players[21]),
      ],
      refreshWidget: setState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('images/football-field.png')),
            color: Color(0xff148811),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(
            children: _controller.orderedPlayerList
                .map((player) =>
                    DraggablePlayer(player: player, controller: _controller))
                .toList()),
      ),
    );
  }
}

class GameController {
  List<GamePlayer> players;
  GamePlayer? _draggedPlayer;
  GamePlayer? _draggedOverPlayer;
  Offset? _dragPos;
  Function refreshWidget;

  GameController({required this.players, required this.refreshWidget});

  void _swapPlayers() {
    final draggedOverPos = _draggedOverPlayer!.position;
    final draggedPos = _draggedPlayer!.position;

    _draggedPlayer!.setPosition(draggedOverPos);
    _draggedOverPlayer!.setPosition(draggedPos);
  }

  void _checkAllPlayersDragOver() {
    GamePlayer? draggedOverPlayer;

    for (final player in players) {
      if (_draggedPlayer!.team != player.team) continue;
      final hasDragOver = player.checkDragOver(_dragPos!);
      if (hasDragOver) draggedOverPlayer = player;
    }

    _draggedOverPlayer = draggedOverPlayer;
  }

  void startDrag(GamePlayer player) {
    player.startDrag();
    _draggedPlayer = player;
    refreshWidget(() {});
    _dragPos = player.position;
  }

  void endDrag() {
    if (_draggedPlayer == null) return;
    _draggedPlayer!.endDrag();
    if (_draggedOverPlayer != null) _swapPlayers();
    _draggedPlayer = null;
    _draggedOverPlayer = null;
  }

  void updateDrag(Offset position) {
    _dragPos = position;
    _checkAllPlayersDragOver();
  }

  List<GamePlayer> get orderedPlayerList {
    var playerList = players;
    if (_draggedPlayer != null) {
      playerList.remove(_draggedPlayer);
      playerList.add(_draggedPlayer!);
    }

    return playerList;
  }
}

class GamePlayer {
  Key key = Key(_randomString(10));
  bool _isBeingDragged = false;
  late void Function(void Function() fn) _widgetSetState;
  late Function(Offset position) _widgetRefreshPosition;
  Offset position;
  bool hasDragOver = false;
  Team team;
  Player player;

  bool _setDragOver(dragOver) {
    _widgetSetState(() {
      hasDragOver = dragOver;
    });
    return dragOver;
  }

  void startDrag() {
    _isBeingDragged = true;
  }

  void endDrag() {
    _isBeingDragged = false;
  }

  void setPosition(Offset newPosition) {
    _widgetSetState(() {
      hasDragOver = false;
    });
    _widgetRefreshPosition(newPosition);
  }

  bool checkDragOver(Offset dragPos) {
    if (_isBeingDragged) return _setDragOver(false);

    final hotZone = Rectangle(position.dx - 15, position.dy - 15, 80, 80);

    return (_setDragOver(
        hotZone.containsPoint(Point(dragPos.dx, dragPos.dy) + Point(25, 25))));
  }

  void defineWidget(
      {required void Function(void Function() fn) setState,
      required void Function() runAnimation}) {
    _widgetSetState = setState;
    _widgetRefreshPosition = (Offset newPosition) {
      position = newPosition;
      runAnimation();
    };
  }

  GamePlayer(
      {required this.position, required this.team, required this.player});
}

String _randomString(int length) {
  var rand = new Random();
  var codeUnits = new List.generate(length, (index) {
    return rand.nextInt(33) + 89;
  });

  return new String.fromCharCodes(codeUnits);
}

enum Team { orange, pink }
