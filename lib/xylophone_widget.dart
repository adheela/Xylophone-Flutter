import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'audio.dart';
import 'play_event.dart';

class XylophoneWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final children = audios.map((audio) =>
      Expanded(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: audio.colors,
                  begin: Alignment.topRight,
                  end:  Alignment.bottomCenter,
                )
              ),
            ),
            Material(
              child: InkResponse(
                splashColor: Colors.black.withAlpha(35),
                radius: mq.size.height,
                onTap: () => _onTap(context, audio)
              ),
              color: Colors.transparent
            ),
          ],
        ),
      )
    ).toList(growable: false);
    var curPanIndex;
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails d) {
        final newPanIndex = d.localPosition.dx ~/ (mq.size.width / children.length);
        if (curPanIndex != newPanIndex) {
          _onTap(context, audios[newPanIndex]);
          curPanIndex = newPanIndex;
        }
      },
      child: Row(children: children),
    );
  }

  _onTap(BuildContext context, Audio audio) {
    ScopedModel.of<PlayEvent>(context, rebuildOnChange: false).fire();
    audio.play();
  }

}