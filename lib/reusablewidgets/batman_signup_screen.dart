import 'package:batman_animation_challenge/reusablewidgets/buttons.dart';
import 'package:flutter/material.dart';

class BatmanSignUpIn extends AnimatedWidget {
  BatmanSignUpIn(
    Animation animation,
  ) : super(listenable: animation);

  Animation get _animationSignupIn => listenable as Animation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Opacity(
        opacity: _animationSignupIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            150 * (1 - _animationSignupIn.value).toDouble(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Center(
                  child: Text(
                    'GET ACCESS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                _BatmanInput(
                  label: "FULL NAME",
                  obscure: false,
                ),
                SizedBox(
                  height: 20.0,
                ),
                _BatmanInput(
                  label: "EMAIL ID",
                  obscure: false,
                ),
                SizedBox(
                  height: 20.0,
                ),
                _BatmanInput(
                  label: "PASSWARD",
                  obscure: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                BatmanButton(
                  left: false,
                  text: 'SIGNUP',
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BatmanInput extends StatelessWidget {
  final String label;

  final bool obscure;

  const _BatmanInput({required this.label, required this.obscure});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey[600]),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: border,
            border: border),
      ),
    );
  }
}
