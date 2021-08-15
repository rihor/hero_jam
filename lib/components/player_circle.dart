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
  late Animation<Offset> _animation;

  late Offset _position;
  late AssetImage playerImage;

  @override
  void initState() {
    super.initState();
    _position = widget.player.position;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _controller.addListener(() {
      setState(() {
        _position = _animation.value;
      });
    });
    widget.player.defineWidget(setState: setState, runAnimation: _runAnimation);
    playerImage = widget.player.player.image;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation() {
    _animation = _controller
        .drive(Tween<Offset>(begin: _position, end: widget.player.position));

    const spring = SpringDescription(
      mass: 50,
      stiffness: 2,
      damping: 2,
    );

    final simulation = SpringSimulation(spring, 0, 1, 0);

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Transform.translate(
        offset: _position,
        child: GestureDetector(
          onPanDown: (details) {
            widget.controller.startDrag(widget.player);
            _controller.stop();
          },
          onPanUpdate: (details) {
            setState(() {
              _position += details.delta;
              widget.controller.updateDrag(_position);
            });
          },
          onPanEnd: (details) {
            widget.controller.endDrag();
            _runAnimation();
          },
          child: Container(
            margin: EdgeInsets.all(50.0),
            width: 47,
            height: 47,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: widget.player.hasDragOver
                      ? Colors.blue
                      : widget.player.team == Team.orange
                          ? Colors.amber[700]!
                          : Colors.red[600]!,
                ),
                color: widget.player.team == Team.orange
                    ? Colors.amber[700]
                    : Colors.red[600],
                image: DecorationImage(image: playerImage),
                shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
