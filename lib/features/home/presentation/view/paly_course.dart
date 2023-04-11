import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  List videoInfo = [];
  VideoPlayerController? _videoPlayerController;
  ChewieController? chewieController;
  bool isVideoShowen = false;
  int _playingIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.pause();
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.greenAccent, Colors.greenAccent],
        begin: const FractionalOffset(0.0, 0.4),
        end: Alignment.topRight,
      )),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: (isVideoShowen == false)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(Icons.arrow_back_ios,
                                  color: Colors.red),
                            ),
                            Expanded(child: Container()),
                            const Icon(Icons.info_outline,
                                size: 20, color: Colors.red),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "68 min",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [_playVideo(context), _controlVideo(context)],
                    )),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70))),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildListView(context)
              ],
            ),
          ))
        ],
      ),
    ));
  }

  _controlVideo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () async {
            final index = _playingIndex - 1;
            if (index > 0 && videoInfo.isNotEmpty) {
              _initializeVideo(index);
            } else {
              debugPrint('NI VIDEOS NOW ');
            }
          },
          icon: const Icon(Icons.fast_rewind),
        ),
        IconButton(
          onPressed: () async {
            final index = _playingIndex + 1;
            if (index < videoInfo.length) {
              _initializeVideo(index);
            } else {
              debugPrint('YOU WATCHED ALL VIDEOS ');
            }
          },
          icon: const Icon(Icons.fast_forward),
        ),
      ],
    );
  }

  _playVideo(BuildContext context) {
    final controller = _videoPlayerController;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(
            controller: chewieController!,
          ));
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: Text('Loading....')),
      );
    }
  }

  _initializeVideo(int index) {
    final videoPlayerController =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);
    final oldController = _videoPlayerController;
    _videoPlayerController = videoPlayerController;
    if (oldController != null) {
      oldController.pause();
    }
    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    videoPlayerController
      ..initialize().then((_) {
        oldController?.dispose();
        _playingIndex = index;
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true,
        );
        videoPlayerController.play();
        setState(() {});
      });
  }

  buildListView(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: videoInfo.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                _initializeVideo(index);
                setState(() {
                  if (isVideoShowen == false) {
                    isVideoShowen = true;
                  }
                });
              },
              child: Text(videoInfo[index]['title']));
        },
      ),
    );
  }
}
