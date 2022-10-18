import 'package:flutter/material.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({Key? key}) : super(key: key);

  @override
  _Chat_PageState createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  String message = "";
  Color? myColor;

  TextEditingController sendMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic values = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Row(children: [
          InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("/");
                });
              },
              child: const Icon(Icons.arrow_back)),
        ]),
        actions: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(values.image)),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    values.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 3),
                  Text("last seen at ${values.time} PM"),
                ],
              ),
              const SizedBox(width: 32),
              const Icon(
                Icons.videocam,
                size: 24,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.call,
                size: 24,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 5),
            ],
          ),
        ],
        backgroundColor: const Color(0xff075e54),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.89,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,

                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 638,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.82,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Colors.black45,
                                    size: 30,
                                  ),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width *
                                        0.41,
                                    alignment: Alignment.center,
                                    child: TextField(
                                      controller: sendMessage,
                                      decoration:
                                      const InputDecoration.collapsed(
                                        hintText: "Type a message",
                                        hintStyle: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                                const Spacer(),
                                const Icon(
                                  Icons.camera_alt,
                                  size: 22,
                                  color: Colors.black45,
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.mic,
                                  size: 22,
                                  color: Colors.black45,
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: const Color(0xff075e54),
                            onPressed: () {
                              setState(() {
                                message = sendMessage.text;
                                myColor = Colors.white;
                                sendMessage.clear();
                              });
                            },
                            child: const Icon(
                              Icons.send,
                              size: 22,
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 210),
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: myColor, borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
