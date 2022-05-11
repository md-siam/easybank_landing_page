import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          colors: [
            Color(0xff00F260),
            Color(0xff2AB9D2),
          ],
        ),
      ),
      child: MaterialButton(
        splashColor: Colors.amber,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}