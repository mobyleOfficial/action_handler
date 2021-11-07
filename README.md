# Action Handler

Simple way to decouple actions from View.

## Actions

An action is everything that can interact with the user, but it's not a state.

Example 1: Navigate to another Page after some backend operation. The backend result should not be placed inside the button onPressed
(because it's not its responsibility to deal with it), so it's safe to assume that this is an action.

Example 2: Show a non blocking error (dialog) after some operation. If it's necessary to show a dialog after some non blocking error,
this logic should not me placed inside the button onPressed method, so this is probably an action too.

## How to use it

There're 2 (two) available widgets: ActionHandler and ValueListenableActionHandler.

The first one uses Streams, the second one uses ValueNotifier. Once your Widget is completed, you MUST dispose the Stream/ValueNotifier.

```dart
ActionHandler<int>(
    actionInput: _controller.onStreamEvent,
    actionResult: (result) {
      print('Stream: $result \n');
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
```
## Author

This package is an based on [Edson Bueno's](https://www.linkedin.com/in/edsonvbjr/) idea, published and written by Mobyle's writer Bruno Abe.