import 'package:flutter/material.dart';
import '../widgets/index.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List questionAnsList = [
    {
      'question': '1. An ________ is a real-time representation of any entity.',
      'answer': 'C',
      'options': {
        'A': 'A . class',
        'B': 'B . method',
        'C': 'C . object',
        'D': 'D . None of the above',
      }
    },
    {
      'question':
          '2. Access to a cloud database through Flutter is available through which service?',
      'answer': 'B',
      'options': {
        'A': 'A . SQLite',
        'B': 'B . Firebase Database',
        'C': 'C . NOSQL',
        'D': 'D . MYSQL',
      }
    },
    {
      'question': '3. The _______ function is a predefined method in Dart.',
      'answer': 'C',
      'options': {
        'A': 'A . declare()',
        'B': 'B . list()',
        'C': 'C . main()',
        'D': 'D . return()',
      }
    },
    {
      'question':
          '4. Who developed the Flutter Framework and continues to maintain it today?',
      'answer': 'C',
      'options': {
        'A': 'A . Facebook',
        'B': 'B . Microsoft',
        'C': 'C . Google',
        'D': 'D . Oracle',
      }
    },
    {
      'question': '5. How many types of widgets are there in Flutter?',
      'answer': 'A',
      'options': {
        'A': 'A . 2',
        'B': 'B . 4',
        'C': 'C . 6',
        'D': 'D . 8+',
      }
    },
  ];
  int questionIndex = 0;
  int correctAnswerCount = 0;
  List<bool> userAnswers = [];
  double indicatorPercent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/brain.png',
              width: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearPercentIndicatorWidget(
                            indicatorPercent: indicatorPercent),
                        Text(
                          '$correctAnswerCount / ${questionAnsList.length}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ScoreTrackerIcon(userAnswersList: userAnswers),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  questionAnsList[questionIndex]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            quizAnswerButton(
              buttonLabels: questionAnsList[questionIndex]['options']['A'],
              onTap: () {
                CheckUserAnswerAndShowResultDialog(selecetdAnswerByUser: 'A');
                setState(() {});
              },
            ),
            quizAnswerButton(
              buttonLabels: questionAnsList[questionIndex]['options']['B'],
              onTap: () {
                CheckUserAnswerAndShowResultDialog(selecetdAnswerByUser: 'B');
                setState(() {});
              },
            ),
            quizAnswerButton(
              buttonLabels: questionAnsList[questionIndex]['options']['C'],
              onTap: () {
                CheckUserAnswerAndShowResultDialog(selecetdAnswerByUser: 'C');
                setState(() {});
              },
            ),
            quizAnswerButton(
              buttonLabels: questionAnsList[questionIndex]['options']['D'],
              onTap: () {
                CheckUserAnswerAndShowResultDialog(selecetdAnswerByUser: 'D');
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

//F U N C T I O N S
  //reset default values
  void ResetData() {
    questionIndex = 0;
    userAnswers = [];
    correctAnswerCount = 0;
    indicatorPercent = 0;
  }

  //check user answer and show result dialog
  void CheckUserAnswerAndShowResultDialog(
      {required String selecetdAnswerByUser}) {
    indicatorPercent = indicatorPercent + 0.2;
    if (questionAnsList[questionIndex]['answer'] == selecetdAnswerByUser) {
      correctAnswerCount++;
      userAnswers.add(true);
    } else {
      userAnswers.add(false);
    }
    if (questionIndex < 4) questionIndex++;

    if (userAnswers.length == questionAnsList.length) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Result'),
              content: Text(
                  'Your get ${(correctAnswerCount / questionAnsList.length) * 100} %'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ResetData();
                    setState(() {});
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    }
  }
}
