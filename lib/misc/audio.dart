import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

const _EDGE = 7;
const _COLOR = Colors.lightBlue;

final player = AudioCache();

final audios = List.generate(_EDGE, (i) => Audio("note${_EDGE-i}.wav", _COLOR[(i+1)*100]));

class Audio {
  final String name;
  final Color color;
  const Audio(this.name, this.color)
      : assert(name != null), assert(color != null);
}