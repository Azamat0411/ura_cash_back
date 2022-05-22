import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ura_cash_back/bloc/stream_listener.dart';
class StreamConsumer<T> extends StatefulWidget {
  /// The [Stream] which will be subscribed to.
  final Stream<T> stream;

  /// On each data event from the [stream],
  /// the subscriber's [onData] handler is called.
  final StreamOnDataListener<T> listener;

  /// On errors from this stream, the [onError] handler is called with the
  /// error object and possibly a stack trace.
  ///
  /// The [onError] callback must be of type `void onError(error)` or
  /// `void onError(error, StackTrace stackTrace)`. If [onError] accepts
  /// two arguments it is called with the error object and the stack trace
  /// (which could be `null` if this stream itself received an error without
  /// stack trace).
  /// Otherwise it is called with just the error object.
  /// If [onError] is omitted,
  /// any errors on this stream are considered unhandled,
  /// and will be passed to the current [Zone]'s error handler.
  /// By default unhandled async errors are treated
  /// as if they were uncaught top-level errors.
  final StreamOnErrorListener? onError;

  /// If this stream closes and sends a done event, the [onDone] handler is
  /// called. If [onDone] is `null`, nothing happens.
  final StreamOnDoneListener? onDone;

  /// If [cancelOnError] is true, the subscription is automatically canceled
  /// when the first error event is delivered. The default is `false`.
   final bool? cancelOnError;

  /// The data that will be used to create the initial snapshot.
  ///
  /// Providing this value (presumably obtained synchronously somehow when the
  /// [Stream] was created) ensures that the first frame will show useful data.
  /// Otherwise, the first frame will be built with the value null, regardless
  /// of whether a value is available on the stream: since streams are
  /// asynchronous, no events from the stream can be obtained before the initial
  /// build.
  final T? initialData;

  /// The build strategy currently used by this builder.
  final AsyncWidgetBuilder<T> builder;

  /// {@macro stream_listener}
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
