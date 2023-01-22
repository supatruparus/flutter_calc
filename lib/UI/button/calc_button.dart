import 'package:flutter/material.dart';
import 'package:flutter_calc/data/calculator_model.dart';
import 'package:flutter_calc/data/history_provider.dart';
import 'package:flutter_calc/data/pre_result_provider.dart';
import 'package:flutter_calc/data/screen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/equal_pressed_notifier.dart';
import 'style.dart' as style;

class CalcButton extends ConsumerWidget {
  const CalcButton({
    Key? key,
    this.value = '',
    this.child,
    this.onPressed,
  }) : super(key: key);
  final String value;
  final Function()? onPressed;
  final Widget? child;
  final double fontSize = 32;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () {
        _ontap(){
          ref.read(screenProvider.notifier).add(value);
          double res = Calculator.calculate(ref.read(screenProvider));
          ref.read(preResultProvider.notifier).set(res);
          ref.read(isEqualPressedProvider.notifier).set(false);
        }

        ///Очистить экран если до этого нажато =
        if (ref.read(isEqualPressedProvider)) {
          ref.read(historyProvider.notifier).add(ref.read(screenProvider));
          ref.read(screenProvider.notifier).clear();
          ref.read(preResultProvider.notifier).clear();
          ref.read(resultNotifierProvider.notifier).state = '';
        }
        onPressed != null
            ? onPressed!()
            : _ontap();
      },
      child: Container(
          decoration: style.buttonStyle,
          child: Center(
            child: child ??
                Text(
                  value,
                  style: TextStyle(fontSize: fontSize, color: Colors.white70),
                ),
          )),
    );
  }
}
