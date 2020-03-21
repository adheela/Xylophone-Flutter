import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void sound(int n) {
    final player = AudioCache();
    player.play('note$n.wav');
  }

  Expanded buildkey({Color color, int n}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          sound(n);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildkey(color: Colors.red, n: 1),
              buildkey(color: Colors.green, n: 2),
              buildkey(color: Colors.orange, n: 3),
              buildkey(color: Colors.blue, n: 4),
              buildkey(color: Colors.yellowAccent, n: 5),
              buildkey(color: Colors.pink, n: 6),
              buildkey(color: Colors.indigo, n: 7),
            ],
          ),
        ),
      ),
    );
  }
}
