library action_handler;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableActionHandler<T> extends StatefulWidget {
  const ValueListenableActionHandler({
    required this.actionInput,
    required this.actionResult,
    required this.child,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<T> actionInput;
  final ValueChanged<T> actionResult;
  final Widget child;

  @override
  State<StatefulWidget> createState() =>
      _ValueListenableActionHandlerState<T>();
}

class _ValueListenableActionHandlerState<T>
    extends State<ValueListenableActionHandler<T>> {

  @override
  void initState() {
    super.initState();

    widget.actionInput.addListener(() {
      widget.actionResult(widget.actionInput.value);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    super.dispose();
  }
}
