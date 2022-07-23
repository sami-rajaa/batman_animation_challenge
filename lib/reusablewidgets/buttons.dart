import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class BatmanButton extends StatelessWidget {
  final String text;
  final VoidCallback? ontap;
  final bool left;

  const BatmanButton({required this.text, this.ontap, required this.left});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0XFFFDE86A),
      child: InkWell(
        onTap: ontap,
        child: ClipRRect(
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                if (left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-18.0)
                        ..rotateZ(
                          vector.radians(45),
                        ),
                      child: Image.asset(
                        'assets/images/batman_logo.png',
                        height: 65.0,
                        color: const Color(0XFFC8B853),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(18.0)
                        ..rotateZ(
                          vector.radians(-45),
                        ),
                      child: Image.asset(
                        'assets/images/batman_logo.png',
                        height: 65.0,
                        color: const Color(0XFFC8B853),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
