import 'package:flutter/material.dart';
import 'dart:developer';
import 'app_routes.dart';


typedef OnRouteChange<R extends Route<dynamic>> = void Function(
    Route<dynamic> route, Route<dynamic>? previousRoute);

class NavigatorService<R extends Route<dynamic>> extends RouteObserver<R> {
  NavigatorService({
    this.enableLogger = true,
    this.onPush,
    this.onPop,
  }) : _stack = [];
  final bool enableLogger;
  final List<Route> _stack;

  final OnRouteChange<Route>? onPush;
  final OnRouteChange<Route>? onPop;
  List<Route> get stack => List<Route>.from(_stack);

  OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 3,
            decoration: const BoxDecoration(color: Colors.red),
            child: const Icon(Icons.warning, color: Colors.purple)),
      ),
    );
  });

  void _logget(String content) {
    if (enableLogger) {
      log(content);
    }
  }

  void _logStack() {
    final mappedStack =
        _stack.map((Route route) => route.settings.name).toList();
    _logget('Navigator stack: $mappedStack');
  }

  @override
  void didPush(Route route, Route<dynamic>? previousRoute) {
    _logget('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route as R);
    _logStack();
    if (onPush != null) {
      onPush!(route, previousRoute);
    }
    if (identical(route.settings.name, thirdRoute)) {
      print('did push route : $route');
      Future.delayed(Duration.zero, () {
        route.navigator?.overlay?.insert(overlayEntry);
      });
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route<dynamic>? previousRoute) {
    if (onPop != null) {
      onPop!(route, previousRoute);
    }
    _logget('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
    if (route.settings.name == "/thirdPage" && overlayEntry.mounted) {
      overlayEntry.remove();
    }

    super.didPop(route, previousRoute);
  }

  // @override
  // void didStartUserGesture(
  //     Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   _logget(
  //       '{didStartUserGesture} \n route: $route \n previousRoute: $previousRoute');
  //   super.didStartUserGesture(route, previousRoute);
  // }
  //
  // @override
  // void didStopUserGesture() {
  //   _logget('{didStopUserGesture}');
  //   super.didStopUserGesture();
  // }
}
