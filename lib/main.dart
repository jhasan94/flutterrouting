import 'dart:developer';
import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'navigator_service.dart';

void main() {
  runApp(const MyApp());
}

NavigatorService<PageRoute> middleware = NavigatorService<PageRoute>(
  onPush: (route, previousRoute) {
    log('we have push event');

    ///if route is Y we should have some API call
  },
  onPop: (route,previousRoute){
    log('we have pop event');
  }
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      navigatorObservers: [middleware],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          body: Center(
              child: ElevatedButton(
        child: const Text('home page'),
        onPressed: () {
          Navigator.pushNamed(context, secondRoute);
        },
      )));
    });
  }
}
