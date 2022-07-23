import 'package:batman_animation_challenge/reusablewidgets/buttons.dart';
import 'package:flutter/material.dart';

class BatmanScreenButtons extends AnimatedWidget {
  BatmanScreenButtons(Animation animation, this.onTap)
      : super(listenable: animation);
  final VoidCallback onTap;
  Animation get _animateButtonsIn => listenable as Animation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Opacity(
        opacity: _animateButtonsIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            150 * (1 - _animateButtonsIn.value).toDouble(),
          ),
          child: Column(
            children: [
              BatmanButton(
                ontap: () {},
                left: true,
                text: 'LOGIN',
              ),
              const SizedBox(
                height: 20.0,
              ),
              BatmanButton(
                ontap: onTap,
                left: false,
                text: 'SIGNUP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
