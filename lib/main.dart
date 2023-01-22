import 'package:flutter/material.dart';
import 'package:flutter_calc/UI/buttons.dart';
import 'package:flutter_calc/data/history_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'UI/history/history.dart';
import 'UI/screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Grid Desktop Demo',
      theme: ThemeData(

        colorScheme:  ColorScheme.dark(),
      ),
      home: const Scaffold(
        body: LayoutGridExample(),
      ),
    );
  }
}

class LayoutGridExample extends StatelessWidget {
  const LayoutGridExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer(builder: (context, ref, child) {
        ScrollController controller = ScrollController(initialScrollOffset: 0);
        return CustomScrollView(
          controller: ScrollController(initialScrollOffset: 500),
          slivers: [SliverList(
            delegate: SliverChildListDelegate([
              History(),
              Container(height: 300,child: Screen(),),
              Container(height: 430,child: Buttons(),),


            ]),
          )],
        );
      }),
    );
  }
}

