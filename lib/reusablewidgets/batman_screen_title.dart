import 'package:flutter/material.dart';

class BatmanScreenTitle extends AnimatedWidget {
  const BatmanScreenTitle(Animation animation) : super(listenable: animation);
  Animation get _animatetextopacity => listenable as Animation;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animatetextopacity.value,
      child: Column(
        children: const [
          Text(
            'Welcome to',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Text(
            'Batman World',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ],
      ),
    );
  }
}
