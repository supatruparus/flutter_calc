import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryNotifier extends StateNotifier<List<String>> {
  HistoryNotifier() : super([]);
  add(String str){
    if(str.isNotEmpty){
      state = [...state, str];

    }
  }
  clear(){
    state = [];
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier, List<String>>((ref) {
  return HistoryNotifier();
});
