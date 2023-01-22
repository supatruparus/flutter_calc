import 'package:flutter/material.dart';
import 'package:flutter_calc/data/history_provider.dart';
import 'package:flutter_calc/data/screen_provider.dart';
import 'package:flutter_calc/UI/button/calc_button.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_calc/data/calculator_model.dart';
import '../data/equal_pressed_notifier.dart';

class Buttons extends ConsumerWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    return Container(
      height: 500,
      child: LayoutGrid(
        columnGap: 3,
        rowGap: 3,
        columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
        rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
        children: [
          GridPlacement(
            // rowSpan: 2,
              rowStart: 4,
              columnStart: 3,
              rowSpan: 2,
              child: CalcButton(
                onPressed: (){
                  String strScreen = ref.read(screenProvider);
                  double res = Calculator.calculate(ref.read(screenProvider));
                  ref.read(resultNotifierProvider.notifier).set(res);
                  ref.read(isEqualPressedProvider.notifier).set(true);
                  ref.read(historyProvider.notifier).add('$strScreen = ${res.toString()}');
                },
                value: '=',
              )),



          GridPlacement(
            ///Remove button
            rowStart: 0,columnStart: 3,
            child: CalcButton(
              onPressed: () {
                ref.read(screenProvider.notifier).remove();
              },
              child: const Icon(Icons.backspace_outlined),
            ),
          ),
          const GridPlacement(
            child: CalcButton(
              value: '/',
            ),
          ),
          const GridPlacement(
            child: CalcButton(
              value: '%',
            ),
          ),
          // const GridPlacement(
          //   child: CalcButton(
          //     value: '%',
          //   ),
          // ),
          GridPlacement(
            child: CalcButton(
              ///Clear button

              onPressed: (){
                ref.read(screenProvider.notifier).clear();
                ref.read(resultNotifierProvider.notifier).state = '';
              },
              value: 'C',
            ),
          ),
          const GridPlacement(
            child: CalcButton(
              value: '%',
            ),
          ),
          const GridPlacement(child: CalcButton(value: '(',)),
          const GridPlacement(child: CalcButton(value: ')',)),
          const GridPlacement(
            child: CalcButton(
              value: '7',
            ),
          ),
          const GridPlacement(
            child: CalcButton(
              value: '8',
            ),
          ),
          const GridPlacement(
            child: CalcButton(
              value: '9',
            ),
          ),
          GridPlacement(
            rowStart: 2,columnStart: 3,
            child: CalcButton(
              onPressed: (){
                String strScreen = ref.read(screenProvider);
                Screen.getAllNumbers(strScreen);
                ref.read(screenProvider.notifier).add('-');
              },
              value: '-',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: '4',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: '5',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: '6',
            ),
          ),

          const GridPlacement(

            child: CalcButton(
              value: '1',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: '2',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: '3',
            ),
          ),
          const GridPlacement(
            rowStart: 1,columnStart: 3,
            child: CalcButton(
              value: '×',
            ),
          ),
          GridPlacement(
            rowStart: 3,
            columnStart: 3,
            child: CalcButton(
              onPressed: (){
                String strScreen = ref.read(screenProvider);
                Screen.getAllNumbers(strScreen);
                ref.read(screenProvider.notifier).add('+');
              },
              value: '+',
            ),
          ),


          const GridPlacement(

            child: CalcButton(
              value: '+/-',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: '0',
            ),
          ),
          const GridPlacement(

            child: CalcButton(
              value: ',',
            ),
          ),



        ],
      ),
    );
  }


}
