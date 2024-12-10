import 'package:flutter/material.dart';

class LabelledButton extends StatelessWidget {
  const LabelledButton({
    super.key,
    this.radius = 30.0,
    this.backgroundColor = Colors.white,
    required this.onTap,
    required this.label,
    required this.child,
  });

  final double radius;
  final Color? backgroundColor;
  final String label;
  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor ?? Colors.black,
            child: child,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
