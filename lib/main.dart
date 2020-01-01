import 'package:flutter/material.dart';
import 'package:xylophone/xylophone_widget.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
     MaterialApp(
       home: Scaffold(
         body: SafeArea(
           child: XylophoneWidget()
         )
       ),
       themeMode: ThemeMode.dark,
       theme: ThemeData.dark(),
       debugShowCheckedModeBanner: false,
    );
}
