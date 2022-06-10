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
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 15.0,
          right: 15.0,
        ),
        splashColor: Colors.amber,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
