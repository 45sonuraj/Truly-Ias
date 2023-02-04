import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:trueias/quizcard.dart';



class QuizPage extends StatefulWidget {
  final String topic;
  const QuizPage ({ Key? key,required this.topic }): super(key: key);


  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int count=3;
  @override
  Widget build(BuildContext context) {

    SwipeableCardSectionController _cardController = SwipeableCardSectionController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text(widget.topic,style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),)),
            SizedBox(height: 19,),
            Expanded(child: Container(
              child:  SwipeableCardsSection(
                cardController: _cardController,
                context: context,
                items: [
                  QuizCard(Question: questionlist[count-3][0], Answer: questionlist[count-3][1]),
                  QuizCard(Question: questionlist[count-2][0], Answer: questionlist[count-2][1]),
                  QuizCard(Question: questionlist[count-1][0], Answer: questionlist[count-1][1]),
                ],
                //Get card swipe event callbacks
                onCardSwiped: (dir, index, widget) {
                  if(count<=questionlist.length){

                    _cardController.addItem(
                      QuizCard(Question: questionlist[count-3][0], Answer: questionlist[count-3][1]),);
                    count++;
                  }
                  if(count==questionlist.length+1){
                    _cardController.addItem(Card(child:Center(child: Text("Done",style: TextStyle(fontSize: 40),))));
                    count++;
                  }
                  if (dir == Direction.left) {
                    questionlist[index][2]=true;
                  } else if (dir == Direction.right) {
                    questionlist[index][2]=true;
                  }

                },


                //
                enableSwipeUp: true,
                enableSwipeDown: false,
              ),
              //other children

            )),
            Container(height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(child: Icon(Icons.close),radius: 45,backgroundColor: Colors.red),
                CircleAvatar(child: Icon(Icons.check),radius: 45,backgroundColor: Colors.green,)
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
List questionlist=[
  ["Which sect of Buddhism does not believe in idol-worship?","Varanasi ",false],
  ["Dashkumarcharitam was composed by whom?","Dandin ",false],
  ["World’s first oil paintings have been found in which of the following countries?","Afghanistan ",false],
  ["Which Saka king defeated by Gautamiputra Satakarni?","Nahapana ",false],
  ["Jorwe culture, a Chalcolithic culture, was first discovered in which of the following states of India?","Maharashtra ",false]

];