


import 'dart:ffi';

import 'package:chewie/chewie.dart' hide MaterialControls;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uu_app/widgets/video_play_util/video_ui_widget.dart';

import 'package:video_player/video_player.dart';
import 'package:orientation/orientation.dart';




class VideoView extends StatefulWidget {
  VideoView(
      {Key? key,
        required this.playUrl,
        this.autoPlay = false,
        this.rePlay = false,
        this.aspectRatio = 16 / 9,
        this.allowFullScreen = true,
        this.allowMuting = false,
        this.startAt,
        this.placeholder,
        this.barrageUI
      })
      : super(key: key);

  final String playUrl; ///URL
  final bool autoPlay; ///是否自动播放
  final bool rePlay;  ///是否循环播放
  final double aspectRatio; ///比例
  final bool allowFullScreen; ///是否显示全屏按钮
  final bool allowMuting;///是否静音
  Duration? startAt;///从什么时间段开始播放视频
  Widget? placeholder;///封面
  Widget? barrageUI;


  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {

  late VideoPlayerController _videoPlayerController;///video_player vc
  late ChewieController _chewieController;///chewie的播放器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoPlayerController = VideoPlayerController.network(widget.playUrl);
    _chewieController = ChewieController(
        startAt: widget.startAt,
        aspectRatio: widget.aspectRatio,
        videoPlayerController: _videoPlayerController,
        autoPlay: widget.autoPlay,
        looping: widget.rePlay,
        allowFullScreen: widget.allowFullScreen,
        placeholder: widget.placeholder,
        allowMuting: widget.allowMuting,
        customControls: MaterialControls(
          barrageUI: widget.barrageUI,
          overlayUI: videoAppBar(),
          showBigPlayIcon: false,
          showLoadingOnInitialize: true,
          bottomGradient: buildLinearGradient(isDown:true),
        )
    );
    _chewieController.addListener(_fullScreenListeener);


  }

  videoAppBar() {
    return Container(
        decoration: BoxDecoration(
            gradient: buildLinearGradient()),
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            const BackButton(
              color: Colors.white,
            ),
            Expanded(child: SizedBox()),
            Row(
              children:const [
                Icon(Icons.live_tv_rounded,color: Colors.white,size: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Icon(Icons.more_vert_rounded,color: Colors.white,size: 20,)),
              ],
            )
          ],
        ));
  }

  Gradient buildLinearGradient({bool isDown = false}) {
    return LinearGradient(
        begin: isDown ? Alignment.bottomCenter : Alignment.topCenter,
        end: isDown ? Alignment.topCenter : Alignment.bottomCenter,
        colors: const [
          Colors.black54,
          Colors.black45,
          Colors.black38,
          Colors.black26,
          Colors.black12,
          Colors.transparent
        ]);
  }

  _fullScreenListeener(){
    final size = MediaQuery.of(context).size;
    if (size.width > size.height){
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    }
  }

  @override
  Widget build(BuildContext context) {

    double screenW = MediaQuery.of(context).size.width;
    double playerHeight = screenW / widget.aspectRatio;
    return Container(
      width: screenW,
      height:playerHeight,
      color: Colors.grey,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _chewieController.removeListener(_fullScreenListeener);
    _chewieController.dispose();
    _videoPlayerController.dispose();

    super.dispose();

  }
}
