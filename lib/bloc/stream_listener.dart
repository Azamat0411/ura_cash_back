import 'dart:async';
import 'package:flutter/widgets.dart';

typedef StreamOnDataListener<T> = void Function(BuildContext context, T data);

typedef StreamOnErrorListener = void Function(
    dynamic error,
    StackTrace stackTrace,
    );

typedef StreamOnDoneListener = void Function();

class StreamListener<T> extends StatefulWidget {

  final Stream<T> stream;

  final StreamOnDataListener<T> listener;

  final Widget child;

  final StreamOnErrorListener onError;

  final StreamOnDoneListener onDone;

  final bool cancelOnError;

  const StreamListener({
    Key? key,
    required this.stream,
    required this.listener,
    required this.child,
    required this.onError,
    required this.onDone,
    required this.cancelOnError,
  })  :
        super(key: key);

  @override
  _StreamListenerState createState() => _StreamListenerState<T>();

  static _StreamListenerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_StreamListenerState>();
  }
}

class _StreamListenerState<T> extends State<StreamListener<T>> {
  Stream<T> get _stream => widget.stream;
  StreamSubscription<T>? _subscription;

  @override
  void initState() {
    super.initState();
    subscribe();
  }

  @override
  void dispose() {
    unsubscribe();
    super.dispose();
  }

  void subscribe() {
    _subscription = _stream.listen(
          (T data) {
        widget.listener(context, data);
      },
      onError: widget.onError,
      onDone: widget.onDone,
      cancelOnError: widget.cancelOnError,
    );
  }

  void unsubscribe() {
    if (_subscription != null) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
