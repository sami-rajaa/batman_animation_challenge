import 'package:flutter/material.dart';

import '../reusablewidgets/batman_city.dart';
import '../reusablewidgets/batman_screen_button.dart';
import '../reusablewidgets/batman_screen_title.dart';
import '../reusablewidgets/batman_signup_screen.dart';

const _batmanVerticalMovement = 50;

class BatmanScreen extends StatefulWidget {
  const BatmanScreen({Key? key}) : super(key: key);

  @override
  _BatmanScreenState createState() => _BatmanScreenState();
}

class _BatmanScreenState extends State<BatmanScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerForEntrance;
  late Animation<double> _animationLogocomingIn;
  late Animation<double> _animatetextopacity;
  late Animation<double> _animateLogoMovingup;
  late Animation<double> _animateBatmanIn;
  late Animation<double> _animateButtonsIn;

  late AnimationController _animationControllerForSignUp;
  late Animation<double> _animationLogoandbuttonsGoingInvisible;
  late Animation<double> _animationBatmanGoingUpward;
  late Animation<double> _animationBatmanCity;
  late Animation<double> _animationSignupIn;

  void _enteranceAnimations() {
    // controller
    _animationControllerForEntrance = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // logo coming in
    _animationLogocomingIn = Tween(
      begin: 30.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationControllerForEntrance,
        curve: const Interval(0.0, 0.35, curve: Curves.decelerate),
      ),
    );
    // text opacity

    _animatetextopacity = CurvedAnimation(
      parent: _animationControllerForEntrance,
      curve: const Interval(0.45, 0.55),
    );

    // logo moving up
    _animateLogoMovingup = CurvedAnimation(
      parent: _animationControllerForEntrance,
      curve: const Interval(0.45, 0.55),
    );

    // batman coming in
    _animateBatmanIn = Tween(begin: 4.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationControllerForEntrance,
        curve: const Interval(
          0.60,
          0.9,
        ),
      ),
    );

    // buttons coming in

    _animateButtonsIn = CurvedAnimation(
      parent: _animationControllerForEntrance,
      curve: const Interval(0.6, 0.9),
    );

    _animationControllerForEntrance.forward();
  }

  void _setupSignUpAnimations() {
    // Animation Controller
    _animationControllerForSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    // Title buttons going invisible and Batman going downward
    _animationLogoandbuttonsGoingInvisible = CurvedAnimation(
      parent: _animationControllerForSignUp,
      curve: const Interval(0.0, 0.25),
    );

    // Batman moving upward
    _animationBatmanGoingUpward = CurvedAnimation(
      parent: _animationControllerForSignUp,
      curve: const Interval(0.30, 0.50),
    );
    // Batman city coming from nowhere in to the signup screen #magic
    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerForSignUp,
      curve: const Interval(0.55, 0.70),
    );
    _animationSignupIn = CurvedAnimation(
      parent: _animationControllerForSignUp,
      curve: const Interval(0.75, 0.90),
    );
  }

  void _onSignUp() {
    _animationControllerForSignUp.forward(from: 0.0);
  }

  @override
  void initState() {
    _enteranceAnimations();
    _setupSignUpAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerForEntrance.dispose();
    _animationControllerForSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
          ([_animationControllerForEntrance, _animationControllerForSignUp]),
        ),
        builder: (context, _) {
          return Scaffold(
            backgroundColor: const Color(0xFF100F0B),
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset('assets/images/batman_background.png',
                      fit: BoxFit.contain),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(
                        0.0,
                        50.0 * _animationLogoandbuttonsGoingInvisible.value -
                            _animationBatmanGoingUpward.value *
                                _batmanVerticalMovement),
                    child: Transform.scale(
                      scale: _animateBatmanIn.value,
                      child: Image.asset('assets/images/batman_alone.png',
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4.3,
                  left: 45,
                  right: 45,
                  child: BatmanCity(_animationBatmanCity),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BatmanSignUpIn(_animationSignupIn),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.2,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(
                            0.0,
                            50.0 *
                                _animationLogoandbuttonsGoingInvisible.value),
                        child: Opacity(
                          opacity: (1 -
                              _animationLogoandbuttonsGoingInvisible.value),
                          child: BatmanScreenTitle(_animatetextopacity),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Transform.translate(
                        offset: Offset(
                            0.0,
                            50.0 *
                                _animationLogoandbuttonsGoingInvisible.value),
                        child: Opacity(
                          opacity: (1 -
                              _animationLogoandbuttonsGoingInvisible.value),
                          child:
                              BatmanScreenButtons(_animateButtonsIn, _onSignUp),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.7 -
                      28 * _animateLogoMovingup.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: (1 - _animationLogoandbuttonsGoingInvisible.value),
                    child: Transform.scale(
                      scale: _animationLogocomingIn.value,
                      child: Image.asset('assets/images/batman_logo.png',
                          height: 60.0, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
