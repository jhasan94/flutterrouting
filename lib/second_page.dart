import 'package:flutter/material.dart';
import 'app_routes.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RouteAware {
  // OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
  //   return Positioned(
  //     top: 0.0,
  //     left: 0.0,
  //     child: Material(
  //       color: Colors.transparent,
  //       child: Container(
  //           height: MediaQuery.of(context).size.height,
  //           width: MediaQuery.of(context).size.width/3,
  //           decoration: const BoxDecoration(color: Colors.red),
  //           child: const Icon(Icons.warning, color: Colors.purple)),
  //     ),
  //   );
  // });
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  // }
  //
  // @override
  // void dispose() {
  //   routeObserver.unsubscribe(this);
  //   super.dispose();
  // }
  //
  // @override
  // void didPush() {
  //   final route = ModalRoute.of(context)?.settings.name;
  //   print('did push route : $route');
  //   Future.delayed(Duration.zero,(){
  //     Overlay.of(context)?.insert(overlayEntry);
  //   });
  //
  //   // if (overlayEntry.mounted) {
  //   //   overlayEntry.remove();
  //   // }
  // }
  //
  // @override
  // void didPopNext() {
  //   final route = ModalRoute.of(context)?.settings.name;
  //   print('didPopNext route: $route');
  //   //Overlay.of(context)?.insert(overlayEntry);
  //   //overlayEntry.remove();
  // }
  //
  // @override
  // void didPushNext() {
  //   final route = ModalRoute.of(context)?.settings.name;
  //   print('didPushNext route: $route');
  // }
  //
  // @override
  // void didPop() {
  //   final route = ModalRoute.of(context)?.settings.name;
  //   if (overlayEntry.mounted) {
  //     overlayEntry.remove();
  //   }
  //   print('didPop route: $route');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('second page'),
            ),
            ElevatedButton(
              child: const Text('Second page'),
              onPressed: () {
                Navigator.pushNamed(context, thirdRoute);
              },
            )
          ],
        ));
  }
}
