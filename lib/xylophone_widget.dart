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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: audio.colors,
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: MaterialButton(
            onPressed: () {},
            minWidth: double.maxFinite,
            height: double.maxFinite,
          ),
        ),
      )
    ).toList(growable: false);
    return GestureDetector(
      onPanEnd: (_) => _curAudioIdx = null,
      onPanCancel: () => _curAudioIdx = null,
      onPanDown: (e) => _onTapEvent(context, mq, e.localPosition),
      onPanUpdate: (e) => _onTapEvent(context, mq, e.localPosition),
      child: Row(children: children),
    );
  }

  var _curAudioIdx;

  _onTapEvent(BuildContext context, MediaQueryData mq, Offset o) {
    final newPanIndex = o.dx ~/ (mq.size.width / audios.length);
    if (_curAudioIdx != newPanIndex) {
      ScopedModel.of<PlayEvent>(context, rebuildOnChange: false).fire();
      audios[newPanIndex].play();
      _curAudioIdx = newPanIndex;
    }
  }

}