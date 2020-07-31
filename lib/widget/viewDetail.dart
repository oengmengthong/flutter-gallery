import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallerywidget/models/dataWidgets.dart';
import 'package:gallerywidget/values/style.dart';
import 'package:gallerywidget/widget/viewSourceCode.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class DetailWidgetScreen extends StatefulWidget {
  DetailWidgetScreen({Key key, this.dataWidget}) : super(key: key);

  DataWidget dataWidget;
  @override
  _DetailWidgetScreenState createState() => _DetailWidgetScreenState();
}

class _DetailWidgetScreenState extends State<DetailWidgetScreen> {
  _launchURL() async {
    String url = widget.dataWidget.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int currentValue = 0;

  final Map<int, Widget> myTabs2 = const <int, Widget>{0: Text("Preview"), 1: Text("Code")};

  final Map<int, Widget> myTabs3 = const <int, Widget>{
    0: Text("Preview"),
    1: Text("Code"),
    2: Text("Video")
  };

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.dataWidget.videoUrl.isEmpty
          ? 'https://youtu.be/b_sQ9bMltGU'
          : widget.dataWidget.videoUrl),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.dataWidget.title),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (value) => _launchURL(),
              itemBuilder: (context) => [
                PopupMenuItem(
                  height: 30,
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Open Doc"),
                      Spacer(),
                      Icon(Icons.open_in_new, color: Colors.grey)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CupertinoSlidingSegmentedControl(
                    groupValue: currentValue,
                    children: widget.dataWidget.videoUrl.length == 0 ? myTabs2 : myTabs3,
                    onValueChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    }),
              ),
            ),
            Expanded(
              child: [
                widget.dataWidget.child,
                ViewScourceCodeScreen(source: widget.dataWidget.sourceFilePath),
                Align(
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: player,
                        ))),
              ].elementAt(currentValue),
            )
          ],
        ),
      ),
    );
  }
}
