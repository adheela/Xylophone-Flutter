import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import 'misc/extensions.dart';
import 'misc/insets.dart';
import 'play_event.dart';

class InfoWidget extends StatelessWidget {

  build(context) => AnimatedAlign(
    duration: 300.ms,
    curve: Curves.easeIn,
    alignment: ScopedModel.of<PlayEvent>(context, rebuildOnChange: true).x1value
        ? Alignment.bottomRight : Alignment.center,
    child: Padding(
      padding: [10, 10].insets.vertHorz,
      child: AnimatedOpacity(
        duration: 300.ms,
        opacity: () {
          final playEvent = ScopedModel.of<PlayEvent>(context, rebuildOnChange: true);
          return playEvent.x3value ? 0.3 : (playEvent.x1value ? 0.5 : 0.75);
        }(),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(letterSpacing: 1.3),
            children: <TextSpan>[
              TextSpan(text: "Xylophone app",
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
              TextSpan(text: "\n"),
              TextSpan(text: "Tap or swipe to sound",
                  style: TextStyle(fontWeight: FontWeight.w300)
              ),
            ],
          ),
        ),
      ),
    ),
  );

}
