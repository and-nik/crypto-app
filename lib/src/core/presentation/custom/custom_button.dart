import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback onPressed;
  final Widget child;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: .zero,
      // height: size,
      // minWidth: title != null ? 0 : size,
      color: Colors.transparent,
      elevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      materialTapTargetSize: .shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: .circular(22.0)),
      onPressed: onPressed,
      child: child,
    );
  }
}
