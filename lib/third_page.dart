import 'package:flutter/material.dart';


class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

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
        body: const Center(
          child: Text('third page'),
        ));
  }
}
