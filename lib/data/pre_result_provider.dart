import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreResultNotifier extends StateNotifier<String> {
  PreResultNotifier() : super('');

  set(double val){
    String res = '';
    if(val%1 ==0){
      res = val.toInt().toString();
    }
    state = '=$res';
  }
  clear(){
    state = '';
  }
}

final preResultProvider = StateNotifierProvider<PreResultNotifier, String>((ref) {
  return PreResultNotifier();
});
