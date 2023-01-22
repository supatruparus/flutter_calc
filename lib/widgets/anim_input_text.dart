import 'dart:math';

import 'package:flutter/material.dart';

class AnimInputText extends StatefulWidget {
  const AnimInputText(this.text,
      {Key? key,
      this.animDuration,
      this.textAlign = TextAlign.end,
      this.style = const TextStyle(fontSize: 20)})
      : super(key: key);
  final int? animDuration;
  final TextAlign? textAlign;
  final String text;
  final TextStyle style;
  @override
  State<AnimInputText> createState() => _AnimInputTextState();
}

class _AnimInputTextState extends State<AnimInputText> with SingleTickerProviderStateMixin {
  String oldText = '';
  String newText = ' ';
  late Animation<double> animation;
  late Animation<double> rotationAnimation;
  late AnimationController animationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.animDuration ?? 300));
  double size = 1;
  @override
  void initState() {
    rotationAnimation = Tween<double>(begin: -pi/2, end: 0).animate(animationController)
      ..addListener(() {
        print('angle: ${rotationAnimation.value}');
      });
    animation =
        Tween<double>(begin: 1, end: widget.style.fontSize ?? 25).animate(animationController);
    animation.addListener(() {});
    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimInputText oldWidget) {
    if (widget.text.length > oldWidget.text.length) {
      oldText = oldWidget.text;
      newText = widget.text.characters.last;
      animationController.forward(from: 0);
    } else {
      oldText = widget.text;
      newText = ' ';
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> oldTextList = List.generate(
        oldText.length,
        (index) => Text(
              oldText.split('')[index],
              style: widget.style,
            ));

    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        ...oldTextList,
        AnimatedBuilder(
          builder: (context, child) {
            return Transform(
              alignment: Alignment.centerRight,

              transform: Matrix4.rotationY(rotationAnimation.value),
              child: Text(
                newText,
                maxLines: 4,
                textAlign: TextAlign.right,
                style: widget.style,
              ),
            );
          },
          animation: rotationAnimation,
        ),

      ],
    );
  }
}
