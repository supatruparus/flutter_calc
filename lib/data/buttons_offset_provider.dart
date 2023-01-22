import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsOffsetNotifier extends StateNotifier<double> {
  ButtonsOffsetNotifier() : super(0);

  updateOffset(double offsetY){
    state = offsetY;
  }
}

final buttonsOffsetProvider = StateNotifierProvider<ButtonsOffsetNotifier, double>((ref) {
  return ButtonsOffsetNotifier();
});

