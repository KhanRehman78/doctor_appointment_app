import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController =
        VideoPlayerController.networkUrl(widget.videoUrl as Uri);
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((value) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,child:VideoPlayer(_videoPlayerController),);

        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
