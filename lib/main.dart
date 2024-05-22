import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/main/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AudioPlayer audioPlayer = AudioPlayer();
  runApp(MyApp(
    audioPlayer: audioPlayer,
  ));
}
