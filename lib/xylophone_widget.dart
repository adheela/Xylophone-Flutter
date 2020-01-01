import 'package:flutter/material.dart';

import 'misc/audio.dart';

class XylophoneWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final children = audios.map((audio) =>
      Expanded(
        child: Material(color: audio.color,
          elevation: 3,
          child: InkResponse(
            splashColor: Colors.black.withAlpha(35),
            radius: mq.size.height,
            onTap: ()=> player.play(audio.name),
            child: Container(),
          )
        ),
      )
    ).toList(growable: false);
    var panItem;
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails d) {
        final newValue = d.localPosition.dx ~/ (mq.size.width / children.length);
        if (panItem != newValue) {
          player.play(audios[newValue].name);
          panItem = newValue;
        }
      },
      child: Row(children: children),
    );
  }

}