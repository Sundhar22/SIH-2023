import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final TextEditingController _messageController = TextEditingController();

  bool _isRecording = false;
  bool _isPlaying = false;

  Future<void> _playAudio(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> _recordAudio() async {
    setState(() {
      _isRecording = true;
    });

    final PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      setState(() {
        _isRecording = false;
      });
      return;
    }

    // final String filePath = await _audioPlayer.startRecording();

    setState(() {
      _isRecording = false;
    });

    // TODO: Upload the recorded audio file to a server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Audio Message $index'),
                onTap: () => _playAudio('https://example.com/audio/$index.mp3'),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                onPressed: _recordAudio,
              ),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Enter a message',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (_isPlaying) {
                    _audioPlayer.pause();
                  } else {
                    _audioPlayer.resume();
                  }

                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
