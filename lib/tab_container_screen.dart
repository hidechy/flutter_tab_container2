// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:tab_container/tab_container.dart';

class TabContainerScreen extends StatefulWidget {
  const TabContainerScreen({Key? key}) : super(key: key);

  @override
  State<TabContainerScreen> createState() => _TabContainerScreenState();
}

class _TabContainerScreenState extends State<TabContainerScreen> {
  late final TabContainerController _controller;
  int maxNum = 31;

  ///
  @override
  void initState() {
    super.initState();

    _controller = TabContainerController(length: maxNum);
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
            height: 600,
            child: TabContainer(
              controller: _controller,
              color: Colors.redAccent,
              tabEdge: TabEdge.right,
              childPadding: const EdgeInsets.all(20.0),
              tabs: _getTabs4(),
              selectedTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              unselectedTextStyle: const TextStyle(fontSize: 12),
              children: _getChildren4(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _controller.prev(),
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () => _controller.next(),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  List<Widget> _getChildren4() {
    List<Widget> list = [];
    for (var i = 1; i <= maxNum; i++) {
      list.add(
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('item$i'),
            ],
          ),
        ),
      );
    }
    return list;
  }

  ///
  List<String> _getTabs4() {
    List<String> list = [];
    for (var i = 1; i <= maxNum; i++) {
      list.add(
        i.toString().padLeft(2, '0'),
      );
    }
    return list;
  }
}
