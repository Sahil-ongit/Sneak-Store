import 'package:flutter/material.dart';
import 'package:log/components/white_tile.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
        body: Flex(direction: Axis.vertical,
      children: [
     WhiteTile(),
      ],
    ));
  }
}
