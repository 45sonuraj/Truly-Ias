import 'package:flutter/material.dart';

class QuizCard extends StatefulWidget {
  String Question;
  String Answer;
  QuizCard({super.key, required this.Question, required this.Answer});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<QuizCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFront = !isFront;
              });
            },
            child: Stack(
              children: <Widget>[
                Card(
                  color: isFront ? Colors.blue : Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.Question,
                        style: TextStyle(
                            fontSize: 30,
                            color:
                            isFront ? Colors.yellow : Colors.transparent),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: isFront ? Colors.transparent : Colors.red,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(widget.Answer,
                          style: TextStyle(
                              fontSize: 40,
                              color: !isFront
                                  ? Colors.yellow
                                  : Colors.transparent)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
