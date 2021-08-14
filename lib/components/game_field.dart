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
        GamePlayer(position: Offset(200, 200)),
        GamePlayer(position: Offset(100, 100)),
        GamePlayer(position: Offset(500, 100)),
        GamePlayer(position: Offset(400, 200)),
        GamePlayer(position: Offset(150, 300)),
        GamePlayer(position: Offset(450, 300)),
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
      required Function runAnimation}) {
    _widgetSetState = setState;
    _widgetRefreshPosition = (Offset newPosition) {
      position = newPosition;
      runAnimation();
    };
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
