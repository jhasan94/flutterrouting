
import 'package:flutterrouting/second_page.dart';
import 'package:flutterrouting/third_page.dart';
import '../main.dart';

final appRoutes = {
  homeRoute: (_) => const HomePage(),
  //firstRoute: (_) => FirstPage(),
  secondRoute: (_) => const SecondPage(),
  thirdRoute: (_) => const ThirdPage(),
};

const String homeRoute = "/";
//const String firstRoute = "/firstPage";
const String secondRoute = "/secondPage";
const String thirdRoute = "/thirdPage";