import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'info_widget.dart';
import 'play_event.dart';
import 'xylophone_widget.dart';

const XYLOPHONE_COLOR = Colors.purple;

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
     MaterialApp(
       home: Scaffold(
         body: ScopedModel<PlayEvent>(
           model: PlayEvent(),
           child: Stack(
             children: [
               XylophoneWidget(),
               InfoWidget(),
             ]
           ),
         )
       ),
       themeMode: ThemeMode.dark,
       theme: ThemeData.dark(),
       debugShowCheckedModeBanner: false,
    );

}