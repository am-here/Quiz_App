import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question_set1.dart';

Set1 set = Set1();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Expanded> scores = [];
  _QuizPageState() {
    for (int i = 0; i < set.size(); i++) {
      scores.add(const Expanded(
          child: Icon(Icons.check_box_outline_blank, color: Colors.white)));
    }
  }
  int score = 0;
  int index = 0;
  void compute(bool userAns) {
    bool ans = set.getQAns();
    setState(() {
      if (ans == userAns) {
        scores[index++] =
            const Expanded(child: Icon(Icons.check_box, color: Colors.green));
        score++;
      } else {
        scores[index++] = const Expanded(
            child: Icon(Icons.disabled_by_default, color: Colors.red));
      }
      set.nextQ();
    });
    if (set.isFinished()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Score: $score",
        desc: "Quiz Ended",
        buttons: [
          DialogButton(
            child: const Text(
              "Start over!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      set.reset();
      refill();
      index = 0;
      score = 0;
    }
  }

  void refill() {
    for (int i = 0; i < set.size(); i++) {
      scores[i] = const Expanded(
          child: Icon(Icons.check_box_outline_blank, color: Colors.white));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: scores.sublist(0, set.size() ~/ 2),
          ),
        ),
        Row(
          children: scores.sublist(set.size() ~/ 2, set.size()),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                set.getQText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                compute(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                compute(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
