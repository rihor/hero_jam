import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:hero_jam_2021/components/game_field.dart';

class DraggablePlayer extends StatefulWidget {
  final GamePlayer player;
  final GameController controller;

  @override
  Key? get key => player.key;

  const DraggablePlayer({required this.player, required this.controller});

  @override
  _DraggablePlayerState createState() => _DraggablePlayerState();
}

class _DraggablePlayerState extends State<DraggablePlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Point<double>> _animation;

  late Point<double> _position;

  @override
  void initState() {
    super.initState();
    _position = widget.player.position;
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _position = _animation.value;
      });
    });
    widget.player.defineWidget(setState: setState, runAnimation: _runAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation() {
    _animation = _controller.drive(
        Tween<Point<double>>(begin: _position, end: widget.player.position));

    const spring = SpringDescription(
      mass: 30,
      stiffness: 2,
      damping: 2,
    );

    final simulation = SpringSimulation(spring, 0, 1, -1000);

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _position.y,
      left: _position.x,
      child: GestureDetector(
        onPanDown: (details) {
          widget.controller.startDrag(widget.player);
          _controller.stop();
        },
        onPanUpdate: (details) {
          setState(() {
            _position += Point(details.delta.dx, details.delta.dy);
            widget.controller.updateDrag(_position);
          });
        },
        onPanEnd: (details) {
          widget.controller.endDrag();
          _runAnimation();
        },
        child: Container(
          margin: EdgeInsets.all(50.0),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: widget.player.hasDragOver ? Colors.blue : Colors.orange,
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}
