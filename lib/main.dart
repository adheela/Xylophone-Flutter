import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'audio.dart' show AudioExt;
import 'info_widget.dart';
import 'play_event.dart';
import 'xylophone_widget.dart';

const XYLOPHONE_COLOR = Colors.purple;

main() {
  runApp(XylophoneApp());
  AudioExt.preLoad();
}

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