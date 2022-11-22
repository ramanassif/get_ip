import 'package:flutter/material.dart';

class AnimationEffects extends PageRouteBuilder {
  final Widget page;

  AnimationEffects({required this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) => page,
          transitionsBuilder: (context, animation, animationTwo, child) {
            return Align(
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
        );
}
