import 'package:authfirebase/modules/AudioRecorder/AudioPlayer.dart';
import 'package:authfirebase/modules/AudioRecorder/AudioRecorder.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;

class AudioFeature extends StatefulWidget {
  const AudioFeature({Key? key}) : super(key: key);

  @override
  State<AudioFeature> createState() => _AudioFeatureState();
}

class _AudioFeatureState extends State<AudioFeature> {
  bool showPlayer = false;
  ap.AudioSource? audioSource;
  @override
  Widget build(BuildContext context) {
    return showPlayer
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: AudioPlayer(
              source: audioSource!,
              onDelete: () {
                setState(() => showPlayer = false);
              },
            ),
          )
        : AudioRecorder(
            onStop: (path) {
              setState(() {
                audioSource = ap.AudioSource.uri(Uri.parse(path));
                showPlayer = true;
              });
            },
          );
  }
}
