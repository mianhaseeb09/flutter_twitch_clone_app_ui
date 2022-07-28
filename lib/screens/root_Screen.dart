import 'package:flutter/material.dart';
import 'package:flutter_twitch_clone_app_ui/theme/colors.dart';
import 'package:flutter_twitch_clone_app_ui/widgets/browse_screen.dart';
import 'package:flutter_twitch_clone_app_ui/widgets/discovery_screen.dart';
import 'package:flutter_twitch_clone_app_ui/widgets/following_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      bottomNavigationBar: getTab(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      leading: IconButton(
        onPressed: () {},
        icon: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: white.withOpacity(0.7)),
          child: const Center(
            child: Icon(
              Icons.person,
              color: black,
              size: 20,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.wifi,
              color: white,
              size: 22,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_camera_back,
              color: white,
              size: 22,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.inbox_outlined,
              color: white,
              size: 22,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.comment_outlined,
              color: white,
              size: 25,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: white,
              size: 22,
            ))
      ],
    );
  }

  Widget getTab() {
    List iconItems = [
      Icons.heart_broken,
      Icons.compass_calibration_outlined,
      Icons.copy,
    ];
    List textItems = ["Following", "Discover", "Browser"];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        border:
            Border(top: BorderSide(width: 0.5, color: white.withOpacity(0.2))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    iconItems[index],
                    size: 30,
                    color:
                        pageIndex == index ? secondary : white.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                      color: pageIndex == index
                          ? secondary
                          : white.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const <Widget>[
        FollowingScreen(),
        DiscoveryScreen(),
        BrowseScreen(),
      ],
    );
  }
}
