import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_provider.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 500,child: Consumer(
        builder: (context, ref, child) {
          List<String> list = ref.watch(historyProvider);
          List<Widget> historyList = List.generate(list.length, (index) => Text(list[index], style: TextStyle(fontSize: 20),));
          return Column(
              children: [IconButton(onPressed: (){ref.read(historyProvider.notifier).clear();}, icon: Icon(Icons.delete)),...historyList] );
        }
    ),);
  }
}
