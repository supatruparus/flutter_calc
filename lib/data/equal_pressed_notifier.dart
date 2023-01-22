import 'package:flutter/material.dart';
import 'package:flutter_calc/data/screen_provider.dart';
import 'package:riverpod/riverpod.dart';

class boolNotifier extends StateNotifier<bool> {
  boolNotifier({this.value = false}) : super(value);
  final bool value;
  set(bool value){
    state = value;
  }

}

final isEqualPressedProvider = StateNotifierProvider<boolNotifier, bool>((ref) {
  return boolNotifier();
});
