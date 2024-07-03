import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/big_text.dart';
import 'package:flutter_quiz_app/questions_model.dart';
import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:flutter_quiz_app/small_text.dart';

class ReportPage extends StatelessWidget {
  ReportPage({super.key, this.quizIndex});
  int? quizIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //  padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                //   gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                )),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: BigText(
                  'Report ',
                ),
                subtitle: SmallText(
                  'Hi, this is report for your answers.',
                ),
                trailing: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/quiz.jpg'),
                ),
              ),
            ]),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizes[quizIndex!].questions.length,
                  itemBuilder: (context, index) {
                    return reportItem(quizIndex!, index);
                  },
                )),
          ),
        ],
      ),
    ));
  }
}

reportItem(int quizIndex, int questinIndex) {
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.white,
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [Colors.blue, Colors.pink])),
          child: Column(
            children: [
              BigText(
                'question ${questinIndex + 1}',
                size: 20,
              ),
              BigText(
                '${quizes[quizIndex!].questions[questinIndex].questions}',
                size: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(221, 232, 233, 235),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: BigText(
                  'Correct Answer',
                  size: 18,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: BigText(
                  '${quizes[quizIndex].questions[questinIndex].correctAnswer} ',
                  //    '${((quizes[quizIndex].questions[questinIndex].answers.where((element) => element.identitire.toString() == quizes[quizIndex].questions[questinIndex].correctAnswer).toString())} ',

                  size: 18,
                  color: const Color.fromARGB(255, 55, 172, 59),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: BigText(
                  'Your Answer',
                  size: 18,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: BigText(
                  '${quizes[quizIndex].questions[questinIndex].selectAnswer}',
                  size: 18,
                  color: Colors.indigoAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
