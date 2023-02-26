import "package:flutter/material.dart";
import '../vision_detector_views/pose_detector_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final videoURL = "https://www.youtube.com/watch?v=YMx8Bbev6T4";

  late YoutubePlayerController _controller;
  
  @override

  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      )
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    
    return Scaffold(
    body: SafeArea(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => debugPrint("ready"),
      ),
      ),
      Container(
        child: ElevatedButton(
          onPressed: 
            () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PoseDetectorView())
            ),
          child: const Text("Start practical lesson")
        )
      ),
    ],
    ))
    );
  }
}