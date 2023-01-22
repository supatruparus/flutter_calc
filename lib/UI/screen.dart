import 'package:flutter/material.dart';
import 'package:flutter_calc/data/buttons_offset_provider.dart';
import 'package:flutter_calc/data/calculator_model.dart';
import 'package:flutter_calc/data/pre_result_provider.dart';
import 'package:flutter_calc/data/screen_provider.dart';
import 'package:flutter_calc/widgets/animText.dart';
import 'package:flutter_calc/widgets/anim_input_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen extends ConsumerWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(right: 18, top: 40),
      decoration: const BoxDecoration(),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              color: Colors.transparent,
              child: Consumer(
                builder: (context, ref, child) {
                  return AnimatedContainer(
                    padding: const EdgeInsets.only(right: 20),
                      duration: const Duration(milliseconds: 300),
                      child: AnimInputText(
                        animDuration: 500,
                        ref.watch(screenProvider), style: const TextStyle(fontSize: 42, fontFamily: 'Changa'),));
                }
              ),
            ),
          ),
          Text(
            '${ref.watch(preResultProvider)}', style: const TextStyle(color: Colors.white60, fontSize: 22),),
          Consumer(
            builder: (context, ref, child) {
              return AnimText(text: ref.watch(resultNotifierProvider),textStyle: const TextStyle(fontSize: 56),);
            }
          )
        ],
      ),
    );
  }
}
