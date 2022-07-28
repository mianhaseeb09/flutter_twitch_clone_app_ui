import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitch_clone_app_ui/json/discover_json.dart';
import 'package:flutter_twitch_clone_app_ui/theme/colors.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Discover',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: white),
          ),
          const SizedBox(
            height: 15,
          ),
          getSliderList(),
          const SizedBox(
            height: 25,
          ),
          getSectionTwo(),
          const SizedBox(
            height: 25,
          ),
          getSectionThree(),
          const SizedBox(
            height: 25,
          ),
          getSectionFour(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget getSectionTwo() {
    var size = MediaQuery.of(context).size;
    return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(discover_icons.length, (index) {
          return Container(
            width: (size.width - 32) / 2,
            height: 40,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    discover_icons[index]['label'],
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                  Icon(
                    discover_icons[index]['icon'],
                    color: white,
                    size: 20,
                  )
                ],
              ),
            ),
          );
        }));
  }

  Widget getSliderList() {
    var size = MediaQuery.of(context).size;
    return CarouselSlider(
        items: List.generate(discover_json_one.length, (index) {
          List tags = discover_json_one[index]['tags'];
          return Column(
            children: <Widget>[
              getSliderImages(discover_json_one[index]),
              Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            discover_json_one[index]['name'],
                            style: const TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            discover_json_one[index]['type'],
                            style: TextStyle(
                                fontSize: 16, color: white.withOpacity(0.7)),
                          )
                        ],
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
                ),
              )
            ],
          );
        }),
        options: CarouselOptions(height: 240));
  }

  Widget getSliderImages(item) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(item['img_video']), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: size.width,
            height: 180,
            decoration: BoxDecoration(color: black.withOpacity(0.2)),
          ),
          SizedBox(
            width: size.width,
            height: 180,
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
                        '${item['viewers']} viewers',
                        style: const TextStyle(color: white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSectionThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Live channel we think you`ll like',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: white),
        ),
        const SizedBox(
          height: 15,
        ),
        getSectionThreeList()
      ],
    );
  }

  Widget getSectionThreeList() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(discover_json_three.length, (index) {
        List tags = discover_json_three[index]['tags'];
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: size.width * 0.7,
                  height: 150,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(color: primary),
                  child: Stack(children: [
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                discover_json_three[index]['img_video']),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(color: black.withOpacity(0.2)),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 150,
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
                                      color: white,
                                      fontWeight: FontWeight.w600),
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
                                  '${discover_json_three[index]['viewers']} viewers',
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
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(discover_json_three[index]['img_profile']),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        discover_json_three[index]['name'],
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
                          discover_json_three[index]['title'],
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
                        discover_json_three[index]['type'],
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
                  Icon(
                    Icons.more_vert,
                    color: white.withOpacity(0.5),
                    size: 20,
                  )
                ],
              )
            ]);
      })),
    );
  }

  Widget getSectionFour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories we think you`ll like',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: white),
        ),
        const SizedBox(
          height: 15,
        ),
        getSectionFourList(),
      ],
    );
  }

  Widget getSectionFourList() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          List tags = discover_json_four[index]['tags'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: size.width / 3,
                height: 180,
                decoration: BoxDecoration(
                    color: primary,
                    image: DecorationImage(
                        image: NetworkImage(
                            discover_json_four[index]['img_video']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                discover_json_four[index]['name'],
                style: const TextStyle(
                    fontSize: 17, color: white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    discover_json_four[index]['viewers'],
                    style: TextStyle(color: white.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: size.width / 3,
                child: SingleChildScrollView(
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
              ),
            ],
          );
        }),
      ),
    );
  }
}
