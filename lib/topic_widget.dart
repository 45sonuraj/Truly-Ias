import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  String topicName;
  VoidCallback ontapfunction;


  TopicWidget({super.key,required this.topicName,required this.ontapfunction});

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.only(right:_width*0.1,left: _width*0.1,top: _width*0.1,bottom: _width*0.05),
        child: InkWell(
          onTap: ontapfunction,
          child: Container(
            height: MediaQuery.of(context).size.height*0.25,
            width: _width*0.25,
            color: Colors.grey,
            child: Center(
              child: Text(topicName),
            ),
          ),
        ),
      ),
    );
  }
}
