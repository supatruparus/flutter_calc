import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:riverpod/riverpod.dart';

class Screen {
  static List<double> getAllNumbers(String string) {
    String newString = string;
    for (var sign in _signs) {
      newString = newString.replaceAll(sign, '#');
    }
    List<String> splittedString = newString.split('#');

    List<double> numbers =
        List.generate(splittedString.length, (index) => double.parse(splittedString[index]));
    return numbers;
  }

  add(BuildContext context) {}
}

class Calculator {
  List<double> variables = [];
  final String result;
  final String expression;

  static double calculate(String str) {
    Parser p = Parser();
    String formattedString = str.replaceAll(',', '.');
      formattedString = formattedString.replaceAll('×', '*');
    print(formattedString);
    Expression expression = p.parse(formattedString);

    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    return eval;
  }

//<editor-fold desc="Data Methods">

  Calculator({
    required this.variables,
    this.result = '',
    this.expression = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Calculator && runtimeType == other.runtimeType && variables == other.variables);

  @override
  int get hashCode => variables.hashCode;

  @override
  String toString() {
    return 'Calculator{' + ' variables: $variables,' + '}';
  }

  Calculator copyWith({
    List<double>? variables,
  }) {
    return Calculator(
      variables: variables ?? this.variables,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'variables': variables,
    };
  }

  factory Calculator.fromMap(Map<String, dynamic> map) {
    return Calculator(
      variables: map['variables'] as List<double>,
    );
  }

//</editor-fold>
}

const List<String> _signs = ['*', '-', '+', '/', '%'];



class ResultNotifier extends StateNotifier<String> {
  ResultNotifier() : super('');
  double calc(String str) {
    String formattedString = str.replaceAll('✕', '*');
    print(formattedString);
    // double result = Calculator.calculate(formattedString);
    // String resultString = result.toString();
    // if (result % 1 == 0) {
    //   // resultString = result.toString().substring(0,resultString.length-2);
    //   resultString = result.toInt().toString();
    // }
    // state = resultString;
    return 33;
  }
  set(double val){
    String res = '';
    if(val%1 ==0){
      res = val.toInt().toString();
    }
    state = res;
  }
}

final resultNotifierProvider = StateNotifierProvider<ResultNotifier, String>((ref) {
  return ResultNotifier();
});
