import 'package:flutter/material.dart';
import 'package:trueias/draweritem.dart';
import 'package:trueias/quiz_page.dart';
import 'package:trueias/revise.dart';
import 'package:trueias/topic_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 30.0, left: _width * 0.1, bottom: 20.0),
            child: Text(
              "Hello XYZ,",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              TopicWidget(
                  topicName: "Ancient",
                  ontapfunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizPage(topic: "Ancient History")));
                  }),
              TopicWidget(
                  topicName: "Medievel",
                  ontapfunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizPage(topic: "Medievel History")));
                  }),
            ],
          ),
          Row(
            children: [
              TopicWidget(
                  topicName: "CA",
                  ontapfunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(topic: "CA")));
                  }),
              TopicWidget(
                  topicName: "Polity",
                  ontapfunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(topic: "Polity ")));
                  }),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerItem(
                itemName: "Home",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            DrawerItem(
                itemName: "Revise",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Revise()));
                }),
            DrawerItem(itemName: "All Read", ontap: () {}),
            SizedBox(
              height: 380,
            ),
            DrawerItem(itemName: "Social Media Share", ontap: () {}),
            Container(
                color: Colors.grey.shade400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MakeButton(icondata: Icons.telegram, onpressed: () {}),
                    MakeButton(icondata: Icons.whatsapp, onpressed: () {}),
                    MakeButton(icondata: Icons.sms, onpressed: () {}),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MakeButton extends StatelessWidget {
  IconData icondata;
  VoidCallback onpressed;
  MakeButton({required this.icondata, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Icon(
        icondata,
        size: 35,
      ),
      style:
          ElevatedButton.styleFrom(shape: CircleBorder(side: BorderSide.none)),
    );
  }
}
