import 'dart:async';

import 'package:flutter/material.dart';

class HttpPageWrapper<T> extends StatefulWidget {
  final Future<T> Function() dataRequest;
  final Function contentBuilder;
  final Widget? errorWidget;
  final Widget? noDataWidget;
  final Widget? loadingWidget;

  const HttpPageWrapper({
    Key? key,
    required this.dataRequest,
    required this.contentBuilder,
    this.errorWidget,
    this.noDataWidget,
    this.loadingWidget,
  }) : super(key: key);

  @override
  _HttpPageWrapperState createState() => _HttpPageWrapperState<T>();
}

class _HttpPageWrapperState<T> extends State<HttpPageWrapper> {
  final StreamController<T> streamController = StreamController<T>();

  Future<void> _getData() async {
    try {
      T data = await widget.dataRequest();
      streamController.add(data);
    } catch (e) {
      streamController.addError(e);
      rethrow;
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getData,
      child: StreamBuilder<T>(
        stream: streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return buildErrorWidget();
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return buildLoadingWidget();
              case ConnectionState.active:
              case ConnectionState.done:
                if (!snapshot.hasData || (snapshot.data is List && (snapshot.data as List).isEmpty)) {
                  return buildNoDataWidget();
                } else {
                  return buildContentWidget(context, snapshot.data!);
                }
              case ConnectionState.none:
              default:
                return buildNoDataWidget();
            }
          }
        },
      ),
    );
  }

  Widget buildContentWidget(BuildContext context, T data) {
    return widget.contentBuilder(context, data);
  }

  Widget buildErrorWidget() {
    return widget.errorWidget ?? const Center(child: Text('An Error Occurred!'));
  }

  Widget buildNoDataWidget() {
    return widget.noDataWidget ?? const Center(child: Text('No Data'));
  }

  Widget buildLoadingWidget() {
    return widget.loadingWidget ?? const Center(child: CircularProgressIndicator());
  }
}
