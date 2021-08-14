import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hero_jam_2021/components/player_circle.dart';

class GameField extends StatefulWidget {
  @override
  _GameFieldState createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  late GameController _controller;

  @override
  void initState() {
    _controller = GameController(
      players: <GamePlayer>[
        GamePlayer(position: Point<double>(200, 200)),
        GamePlayer(position: Point<double>(100, 100)),
        GamePlayer(position: Point<double>(500, 100)),
        GamePlayer(position: Point<double>(400, 200)),
        GamePlayer(position: Point<double>(150, 300)),
        GamePlayer(position: Point<double>(450, 300)),
      ],
      refreshWidget: setState,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
  Point<double>? _dragPos;
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

  void updateDrag(Point<double> position) {
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
  Point<double> position;
  bool isBeingDragged = false;
  bool hasDragOver = false;
  late Function _widgetSetState;
  late Function _widgetRefreshPosition;

  bool _setDragOver(dragOver) {
    _widgetSetState(() {
      hasDragOver = dragOver;
    });
    return dragOver;
  }

  void startDrag() {
    isBeingDragged = true;
  }

  void endDrag() {
    isBeingDragged = false;
  }

  void setPosition(Point<double> newPosition) {
    _widgetSetState(() {
      position = newPosition;
      hasDragOver = false;
    });
    _widgetRefreshPosition();
  }

  bool checkDragOver(Point<double> dragPos) {
    if (isBeingDragged) return _setDragOver(false);

    final hotZone = Rectangle(position.x, position.y, 50, 50);

    return (_setDragOver(hotZone.containsPoint(dragPos + Point(25, 25))));
  }

  void defineWidget(
      {required Function setState, required Function runAnimation}) {
    _widgetSetState = setState;
    _widgetRefreshPosition = runAnimation;
  }

  GamePlayer({required this.position});
}

String _randomString(int length) {
  var rand = new Random();
  var codeUnits = new List.generate(length, (index) {
    return rand.nextInt(33) + 89;
  });

  return new String.fromCharCodes(codeUnits);
}
