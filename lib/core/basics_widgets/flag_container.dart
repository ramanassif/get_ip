import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FlagAnimation extends StatefulWidget {

  FlagAnimation({Key? key,required this.flag}) : super(key: key);
  String flag;


  @override
  State<FlagAnimation> createState() => _FlagAnimationState();
}

class _FlagAnimationState extends State<FlagAnimation> with AnimationMixin {
  late Animation<double> width;
  late Animation<double> height;
  late Animation<double> opacity;


  @override
  void initState() {
    width = Tween(begin: 0.0, end: 200.0).animate(controller);
    height = Tween(begin: 0.0, end: 150.0).animate(controller);
    opacity = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.value,
      height: height.value,
      padding: const EdgeInsets.all(8),
      // Border width
      decoration: BoxDecoration(
        //color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(48),
          // Image radius
          child: Opacity(
            opacity: opacity.value,
            child: Image.network(widget.flag,
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
