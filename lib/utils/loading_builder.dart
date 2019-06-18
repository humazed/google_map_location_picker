import 'dart:io';

import 'package:flutter/material.dart';

typedef WidgetBuilder<T> = Widget Function(BuildContext context, T snapshot);

class FutureLoadingBuilder<T> extends StatefulWidget {
  const FutureLoadingBuilder({
    Key key,
    this.future,
    this.initialData,
    @required this.builder,
    this.mutable = false,
  })  : assert(builder != null),
        super(key: key);

  /// The asynchronous computation to which this builder is currently connected,
  /// possibly null.
  ///
  /// If no future has yet completed, including in the case where [future] is
  /// null, the data provided to the [builder] will be set to [initialData].
  final Future<T> future;

  final WidgetBuilder<T> builder;

  /// The data that will be used to create the snapshots provided until a
  /// non-null [future] has completed.
  ///
  /// If the future completes with an error, the data in the [AsyncSnapshot]
  /// provided to the [builder] will become null, regardless of [initialData].
  /// (The error itself will be available in [AsyncSnapshot.error], and
  /// [AsyncSnapshot.hasError] will be true.)
  final T initialData;

  /// default is true
  ///
  /// set to false if the future will change.
  final bool mutable;

  @override
  _FutureLoadingBuilderState<T> createState() =>
      _FutureLoadingBuilderState<T>();
}

class _FutureLoadingBuilderState<T> extends State<FutureLoadingBuilder<T>> {
  Future<T> future;

  @override
  void initState() {
    super.initState();
    future = widget.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.mutable ? widget.future : future,
      initialData: widget.initialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              var error = snapshot.error;
              if (error is SocketException) {
                print(
                    'FutureLoadingBuilder#Error:SocketException-> ${error.message}');
                return Center(
                  child: Text(
                    'Please check your connection',
                    overflow: TextOverflow.fade,
                  ),
                );
              } else {
                print('FutureLoadingBuilder#Error: $error');
                return Center(child: Text('Unknown error'));
              }
            }

            return widget.builder(context, snapshot.data);
        }
      },
    );
  }
}
