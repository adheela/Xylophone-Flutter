import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'main.dart' show XYLOPHONE_COLOR;

const _EDGE = 7;
final _color = XYLOPHONE_COLOR;
final _player = AudioCache();

final audios = List.generate(_EDGE, (i)=> Audio("note${_EDGE-i}.wav", [_color[(i+1)*100], _color.shade900]));

class Audio {
  final String name;
  final List<Color> colors;
  const Audio(this.name, this.colors)
      : assert(name != null), assert(colors.length == 2);
}

extension AudioExt on Audio {

  void play() => _player.play(this.name);

  static void preLoad() {
    _player.loadAll(audios.map((audio)=>audio.name).toList(growable: false));
  }

}