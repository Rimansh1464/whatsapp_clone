import 'dart:math';

import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    double orjWidth = MediaQuery.of(context).size.width;
    double cameraWidth = orjWidth / 24;
    double yourWidth = (orjWidth - cameraWidth) / 5;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff075e54),
          title: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Text(
                  "WhatsApp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              ),
            ],
          ),
          toolbarHeight: 60,
          bottom: TabBar(
            onTap: (val) {},
            indicatorWeight: 3,
            labelPadding: EdgeInsets.symmetric(
                horizontal: (orjWidth - (cameraWidth + yourWidth * 3)) / 8,
                vertical: 5),
            labelColor: Colors.white,
            //indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.white54,
            tabs: [

              SizedBox(
                  width: 90,
                  child: const Text(
                    "CHATS",
                    style: TextStyle(fontSize: 14),
                  )),
              SizedBox(
                  width: 90,
                  child: const Text(
                    "STATUS",
                    style: TextStyle(fontSize: 14),
                  )),
              SizedBox(
                  width: 90,
                  child: const Text(
                    "CALLS",
                    style: TextStyle(fontSize: 14),
                  )),
            ],
            isScrollable: true,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: PeppleData.map((e) => user(e)).toList(),
                    ),
                  ),
                ],
              ),
            ),
            //3 screen
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: const NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRERUQbrIvI5VH_wcb7rkqiQlr4NudBEzI2PQ&usqp=CAU"),
                          child: Container(
                            alignment: const Alignment(1.5, 1.5),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xff075e54),
                              radius: 12,
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "My status",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Tap to add status update",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Recent updates",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: PeppleData.map((e) => statusPage(e)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            //4 screen
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: PeppleData.map((e) => callPage(e)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff075e54),
          onPressed: () {},
          child: Icon(Icons.message),
        ),
      ),
    );
  }

  Widget user(Peppledata data) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("page_2", arguments: data);
        },
        splashColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10,top: 5),
          child: Row(
            children: [
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.black,
                maxRadius: 30,
                backgroundImage: NetworkImage(
                  data.image,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          data.name,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),


                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          data.chat,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusPage(e) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(e.image),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${random.nextInt(59)} minutes ago",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget callPage(e) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(e.image),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.name,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "April ${random.nextInt(30)} , ${random.nextInt(12)}:${random.nextInt(59)},AM",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              (random.nextInt(10) % 2 == 0) ? Icons.call : Icons.video_call,
              color: const Color(0xff075e54),
            )
          ],
        ),
      ),
    );
  }
}
class Peppledata{
  final String name;

  final String chat;
  final String image;
  final int id;

  Peppledata({
    required this.name,

    required this.chat,
    required this.image,
    required this.id,
  });

}
List <Peppledata> PeppleData = <Peppledata> [
  Peppledata(
    name: "harshil",

    chat: "good mornig",
    image: "https://assets-prd.ignimgs.com/2022/08/01/cameron-crovetti-1659376185203.jpg",
    id: 1,
  ),
  Peppledata(
    name: "meet",

    chat: "hello",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyMxvfRWLtm85dYtud6VoT_LRiSLMvgSBceBr8gomzPHFSz8bvbYY5gfFSEDIr9Mvxk1A&usqp=CAU",
    id: 2,
  ),Peppledata(
    name: "rahul",
    chat: "Hey There! Are you using WhatsApp?",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoPAvngNDi2KBAxqRa3WJfjbZzRS1VT7t2Qg&usqp=CAU",
    id: 3,
  ),Peppledata(
    name: "raj",
    chat: "How are you Bro?",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgnlVO6WKWGgb8zDXtn8Rb1FIqFYr-MNjXg&usqp=CAU",
    id: 4,
  ),Peppledata(
    name: "kevin",
    chat: "very nice",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA1bCUtTC1-y77NE_mnPL9oXkryFh3AuFyrdOoGWhlLLyGNpMdbFU9DVgfbt0VqX008f0&usqp=CAU",
    id: 5,
  ),Peppledata(
    name: "hardik",
    chat: "heppy",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4mi3x3c3Qc0EeWIA2Mz9xV0NRp6DRdksubQ&usqp=CAU",
    id: 6,
  ),
  Peppledata(
    name: "karan",
    chat: "How are you Bro?",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgnlVO6WKWGgb8zDXtn8Rb1FIqFYr-MNjXg&usqp=CAU",
    id: 4,
  ),Peppledata(
    name: "joy",
    chat: "very nice",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA1bCUtTC1-y77NE_mnPL9oXkryFh3AuFyrdOoGWhlLLyGNpMdbFU9DVgfbt0VqX008f0&usqp=CAU",
    id: 5,
  ),Peppledata(
    name: "joh",
    chat: "heppy",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4mi3x3c3Qc0EeWIA2Mz9xV0NRp6DRdksubQ&usqp=CAU",
    id: 6,
  ),
];