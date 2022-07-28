import 'package:flutter/material.dart';
import 'package:flutter_twitch_clone_app_ui/theme/colors.dart';
import 'package:video_player/video_player.dart';

class LiveStreaming extends StatefulWidget {
  final List tags;
  final String name;
  final String profile;
  final String title;
  final String type;
  final String viewers;
  final String videoUrl;

  const LiveStreaming(
      {Key? key,
      required this.tags,
      required this.name,
      required this.profile,
      required this.title,
      required this.type,
      required this.viewers,
      required this.videoUrl})
      : super(key: key);

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        setState(() {
          _videoPlayerController.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: white.withOpacity(0.15)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
        child: Row(
          children: <Widget>[
            Container(
              width: size.width * 0.85,
              height: 45,
              decoration: BoxDecoration(
                  color: white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.65,
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        cursorColor: white.withOpacity(0.5),
                        style: TextStyle(color: white.withOpacity(0.5)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Send a message',
                            hintStyle:
                                TextStyle(color: white.withOpacity(0.5))),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Icon(
                        Icons.diamond_outlined,
                        color: white,
                      ),
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: white,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.more_vert,
                    color: white.withOpacity(
                      0.5,
                    ),
                    size: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          getVideoSection(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getProfileSection(),
              Divider(
                thickness: 0.8,
                color: white.withOpacity(0.15),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'CHAT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color: white),
                ),
              ),
              Divider(
                thickness: 0.8,
                color: white.withOpacity(0.15),
              ),
              getGiftSection()
            ],
          ))
        ],
      ),
    );
  }

  Widget getVideoPlayer() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.28,
      decoration: const BoxDecoration(color: primary),
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }

  Widget getVideoSection() {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: size.height * 0.28,

      child: Stack(
        children: <Widget>[
          getVideoPlayer(),
          getIconSection(),
        ],
      ),
    );
  }

  Widget getIconSection() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.28,
      decoration: BoxDecoration(color: black.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 20,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: white,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.ondemand_video_sharp,
                        color: white,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: white,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 9,
                    height: 9,
                    decoration: const BoxDecoration(
                        color: Colors.redAccent, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Live',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${widget.viewers}viewers',
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getProfileSection() {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50 / 2),
              child: Image.network(
                widget.profile,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: white),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  widget.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  widget.type,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(widget.tags.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 2),
                            child: Text(
                              widget.tags[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: white.withOpacity(0.7),
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            )),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Follow',
                  style: TextStyle(
                      fontSize: 16, color: white, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getGiftSection() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: white.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: (size.width - 24) / 3,
              height: 70,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/images/medal_1.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Max',
                      style: TextStyle(
                        fontSize: 13,
                        color: white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/diamond.png',
                          width: 30,
                          height: 15,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          '250',
                          style: TextStyle(
                              fontSize: 13,
                              color: white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ])),
          Container(
              width: (size.width - 24) / 3,
              height: 70,
              decoration: const BoxDecoration(color: primary),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/medal_2.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      'assets/images/diamond.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'HairDoa',
                      style: TextStyle(
                        fontSize: 13,
                        color: white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                          fontSize: 13,
                          color: white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ])),
          SizedBox(
              width: (size.width - 24) / 3,
              height: 70,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/medal_3.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      'assets/images/diamond.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Imran Khan',
                      style: TextStyle(
                        fontSize: 13,
                        color: white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                          fontSize: 13,
                          color: white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
