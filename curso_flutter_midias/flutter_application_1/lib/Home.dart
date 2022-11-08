import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache audioCache = AudioCache(prefix: "audios/");

  _executar() async {
    audioPlayer = await audioCache.play("musica.mp3");

    /*
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int resultado = await audioPlayer.play(url);

    if( resultado == 1 ){
      //sucesso
    }*/
  }

  @override
  Widget build(BuildContext context) {
    _executar();

    return Container();
  }
}
