import 'package:action_handler/action_handler.dart';
import 'package:action_handler/value_listenable_action_handler.dart';
import 'package:example/main_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          controller: MainController(),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final MainController controller;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  MainController get _controller => widget.controller;

  @override
  Widget build(BuildContext context) => ActionHandler<int>(
    actionInput: _controller.onStreamEvent,
    actionResult: (result) {
      print('Stream: $result \n');
    },
    child: ValueListenableActionHandler(
      actionInput: _controller.onNotifierEvent,
      actionResult: (result) {
        print('ValueNotifier: $result \n');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Action Handler Demo'),
        ),
        body: Center(
          child: Text(
            'Push the button',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _controller.increaseQuantity,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}