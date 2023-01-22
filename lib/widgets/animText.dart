import 'package:flutter/material.dart';

class AnimText extends StatefulWidget {
  const AnimText( {required this.text,Key? key, this.animDuration, this.textStyle = const TextStyle(fontSize: 20), this.size }) : super(key: key);
  final int? animDuration;
  final String text;
  final TextStyle textStyle;
  final double? size;
  @override
  State<AnimText> createState() => _AnimTextState();
}



class _AnimTextState extends State<AnimText> with SingleTickerProviderStateMixin{
  String  oldText = ' ';
  String newText = ' ';
  late Animation<double> animation;
  late AnimationController animationController = AnimationController(vsync: this, duration: Duration(milliseconds:  widget.animDuration ?? 300));
  double size = 1;
  @override
  void initState() {


    animation = Tween<double>(begin: 1, end: widget.textStyle.fontSize ?? 25).animate(animationController);
    animation.addListener(() {});
    animationController.forward(from: 0);
    super.initState();
  }
  @override
  void didUpdateWidget(covariant AnimText oldWidget) {
    if(widget.text != oldWidget.text){
      newText = widget.text;
      animationController.forward(from: 0);

    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder:(context, child) {
        return  Text(

          newText,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: animation.value),
        );

      }, animation: animation,
    );
  }
}
