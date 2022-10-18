import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:radio_player/radio_player.dart';

class RadioPlayerPage extends StatefulWidget {
  const RadioPlayerPage({Key? key}) : super(key: key);

  @override
  State<RadioPlayerPage> createState() => _RadioPlayerPageState();
}

class _RadioPlayerPageState extends State<RadioPlayerPage> {
  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
        title: 'Radio Player',
        url: 'http://67.212.238.178/proxy/macanudo?mp=/;stream/1');

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('12312312312'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isPlaying ? _radioPlayer.pause() : _radioPlayer.play();
        },
        tooltip: 'Control button',
        child: Icon(
          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
        ),
      ),
    );
  }
}
