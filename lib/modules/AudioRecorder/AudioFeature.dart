import 'package:authfirebase/modules/AudioRecorder/AudioPlayer.dart';
import 'package:authfirebase/modules/AudioRecorder/AudioRecorder.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:http/http.dart' as http;

class AudioFeature extends StatefulWidget {
  const AudioFeature({Key? key}) : super(key: key);

  @override
  State<AudioFeature> createState() => _AudioFeatureState();
}

class _AudioFeatureState extends State<AudioFeature> {
  bool showPlayer = false;
  String result='not yet';
  ap.AudioSource? audioSource;
  @override
  Widget build(BuildContext context) {
    return
      showPlayer
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [Text(result),AudioPlayer(
                source: audioSource!,
                onDelete: () {
                  setState(() => showPlayer = false);
                },
              )],mainAxisSize: MainAxisSize.min,),
            )
          : AudioRecorder(
              onStop: (path) async {
                var request = http.MultipartRequest(
                    'POST', Uri.parse('http://192.168.1.11/MR/MR/upload.php'));
                request.files
                    .add(await http.MultipartFile.fromPath('record', path));
                var res = await request.send();
                res.stream.bytesToString().then((value) => setState(() {
                  result=value;
                }) );
                setState(() {
                  audioSource = ap.AudioSource.uri(Uri.parse(path));
                  showPlayer = true;
                });
              },
            );

  }
}
