import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ura_cash_back/bloc/stream_listener.dart';
class StreamConsumer<T> extends StatefulWidget {

  final Stream<T> stream;

  final StreamOnDataListener<T> listener;

  final StreamOnErrorListener? onError;

  final StreamOnDoneListener? onDone;

   final bool? cancelOnError;

  final T? initialData;

  final AsyncWidgetBuilder<T> builder;

  const StreamConsumer({
    Key? key,
    required this.stream,
     required this.listener,
    required this.builder,
     this.onError,
     this.onDone,
      this.cancelOnError,
     this.initialData,
  })  : super(key: key);

  @override
  _StreamConsumerState createState() => _StreamConsumerState<T>();

  static void stopListening(BuildContext context) {
    StreamListener.of(context)?.unsubscribe();
  }

  static _StreamConsumerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_StreamConsumerState>();
  }
}

class _StreamConsumerState<T> extends State<StreamConsumer<T>> {
  Stream<T> get _stream => widget.stream;

  @override
  Widget build(BuildContext? context) {
    return Builder(builder: (context){
      return StreamListener(
        stream: _stream,
        listener: widget.listener,
        // onDone: widget.onDone!,
        // onError: widget.onError!,
        // cancelOnError: widget.cancelOnError!,
        onError: (error, StackTrace stackTrace) {  },
        onDone: () {  },
        cancelOnError: false,
        child: StreamBuilder(
          stream: _stream,
          initialData: widget.initialData,
          builder: widget.builder,
        ),
      );
    });
  }
}
