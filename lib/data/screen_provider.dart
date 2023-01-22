import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenNotifier extends StateNotifier<String> {
  ScreenNotifier() : super(' ');
  add(String symbol){
    state = state + symbol;
  }
  remove(){
    state = state.substring(0,state.length-1);
  }
  clear(){
    state = '';
  }
  calculate(){

  }
  save(){

  }

}




final screenProvider = StateNotifierProvider<ScreenNotifier, String>
((ref) => ScreenNotifier());

