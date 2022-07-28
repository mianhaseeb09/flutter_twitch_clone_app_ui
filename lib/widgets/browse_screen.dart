import 'package:flutter/material.dart';
import 'package:flutter_twitch_clone_app_ui/json/browse_json.dart';
import 'package:flutter_twitch_clone_app_ui/theme/colors.dart';
import 'package:flutter_twitch_clone_app_ui/json/following_json.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: getAppBar(),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return TabBarView(children: <Widget>[
      getCategories(),
      getLiveChannels(),
    ]);
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: const [
            Text(
              'Browse',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: white),
            )
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TabBar(
              indicatorColor: primary,
              indicatorWeight: 3,
              isScrollable: true,
              tabs: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Live Channels',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: List.generate(categories.length, (index) {
        List tags = categories[index]['tags'];
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 80,
                decoration: BoxDecoration(
                    color: primary,
                    image: DecorationImage(
                        image: NetworkImage(
                          categories[index]['img_video'],
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                  child: SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        categories[index]['name'],
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: white),
                      ),
                      Text(
                        '${categories[index]['viewers']} viewers',
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: white.withOpacity(0.5)),
                      ),
                      const SizedBox(width: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(tags.length, (index) {
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
                                    tags[index],
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
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        );
      })),
    );
  }

  Widget getLiveChannels() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
          children: List.generate(following_json.length, (index) {
        List tags = following_json[index]['tags'];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
                width: size.width,
                height: 200,
                decoration: const BoxDecoration(color: primary),
                child: Stack(children: [
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(following_json[index]['img_video']),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(color: black.withOpacity(0.2)),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Live',
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '${following_json[index]['viewers']} viewers',
                                style: const TextStyle(color: white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(following_json[index]['img_profile']),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          following_json[index]['name'],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            following_json[index]['title'],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15,
                                color: white.withOpacity(0.5),
                                overflow: TextOverflow.clip),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          following_json[index]['type'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15,
                              color: white.withOpacity(0.5),
                              overflow: TextOverflow.clip),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: List.generate(tags.length, (index) {
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
                                    tags[index],
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
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: white.withOpacity(0.5),
                  size: 20,
                )
              ],
            )
          ]),
        );
      })),
    );
  }
}
