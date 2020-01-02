import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'main.dart';

const _EDGE = 7;

final _color = XYLOPHONE_COLOR;
final  audios = List.generate(_EDGE, (i)=> Audio("note${_EDGE-i}.wav", [_color[(i+1)*100], _color.shade900]), growable: false);
final _players = Map.fromEntries(audios.map((audio)=>MapEntry(audio, AudioCache())).toList(growable: false));

class Audio {
  final String name;
  final List<Color> colors;
  const Audio(this.name, this.colors)
      : assert(name != null), assert(colors.length == 2);
}

extension AudioExt on Audio {

  void play() => _players[this].play(this.name);

}