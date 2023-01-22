import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ViewModel{
  ViewModel({this.title = 'title', this.age = 0});
  final String title;
  final int age;

}
final viewModelProvider = StateNotifierProvider<ViewModelNotifier, ViewModel>((ref) => ViewModelNotifier());

class ViewModelNotifier extends StateNotifier<ViewModel> {
  ViewModelNotifier() : super(ViewModel()){
    loadValue();


  }
  loadValue()async{
    final sharPref = await SharedPreferences.getInstance();
    state = ViewModel(title: sharPref.getString('title') ?? '', age: sharPref.getInt('age')?? 0);
  }


  incrementAge()async{
    final sharPref = await SharedPreferences.getInstance();
    state = ViewModel(title: state.title, age: state.age +1);
    sharPref.setInt('age', state.age);

  }
  decrementAge()async{
    final sharPref = await SharedPreferences.getInstance();
    state = ViewModel(title: state.title, age: state.age-1);
    sharPref.setInt('age', state.age);

  }

}

