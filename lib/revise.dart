import 'package:flutter/material.dart';
import 'package:trueias/quiz_page.dart';


class Revise extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>_StateRevise();
}

class _StateRevise extends State<Revise>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Revise"),),
      body: Container(
        child: ListView.separated(
            separatorBuilder:  (context, index) {
              return Divider(
                color: questionlist[index][2] ? Colors.blue : Colors.transparent,
              );
            },
            itemCount: questionlist.length,
            itemBuilder: (BuildContext context,int index){
              if(questionlist[index][2]) {
                return
                  ListTile(
                    title: Text("Q. " + questionlist[index][0]),
                    subtitle: Text("A. " + questionlist[index][1]),
                  );
              }
              else{
                return SizedBox();
              }
            }),
      ),
    );
  }

}