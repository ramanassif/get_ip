import 'package:flutter/material.dart';

class AnimationEffects extends PageRouteBuilder {
  final page;

  AnimationEffects({this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) => page,
          transitionsBuilder: (context, animation, animationTwo, child) {
            /// slide, scale, rotation transition
            // var begin = 0.0;
            // var end = 1.0;
            // var tween = Tween(begin: begin, end: end);
            // //var offsetAnimation = animation.drive(tween);
            // var curvesAnimation =
            //     CurvedAnimation(parent: animation, curve: Curves.easeInBack);
            // return ScaleTransition(
            //   scale: tween.animate(curvesAnimation),
            //   child: child,
            // );

            ///size transition
            return Align(
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );

            ///fade transition
            // return FadeTransition(opacity: animation,child: child,);

            ///merge two animation
            // var begin = 0.0;
            // var end = 1.0;
            // var tween = Tween(begin: begin, end: end);
            // //var offsetAnimation = animation.drive(tween);
            // var curvesAnimation =
            //     CurvedAnimation(parent: animation, curve: Curves.easeInBack);
            // return ScaleTransition(
            //   scale: tween.animate(curvesAnimation),
            //   child: RotationTransition(
            //     turns: tween.animate(curvesAnimation),
            //     child: child,
            //   ),
            // );
          },
        );
}
