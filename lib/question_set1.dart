import 'questions.dart';

class Set1 {
  int _index = 0;
  final List<Question> _questions = [
    // Question('First ODI (Cricket) in India was played in Ahemadabad.', true),
    Question('Goa is famous for not producing coconut.', true),
    // Question('Polo was originated in Assam.', false),
    // Question('The Khalsa was born in 1699.', true),
    // Question('Lata Mangeshkar won the Padma Bhushan in 1960.', false),
    Question('Shakespeare wrote 37 plays.', true),
    Question(
        'The first captain of the first ODI Indian team was Sunil Gavaskar.',
        false),
    Question('Baseball originated in Australia.', false),
    // Question(
    //     'Red and green lights are used to indicate foul in ice hockey.', false),
    Question('Ostrich\'s eyes are smaller than its brain.', false),
    Question('Plants observe oxygen from atmosphere.', false),
    // Question(
    //     'The Amateur Athletics Federation of India was established in 1946.',
    //     true),
    Question('The Ramayana was written by Tulsidas.', false),
    Question('Nakshatras are 27 in numbers.', true),
    Question('Sunderban in West Bengal is famous for elephants.', false),
    Question('Vedic astrology counts on the solar system.', false),
    Question('Sabir Bhatia was co-founder of Hotmail.', true),
    Question('Wular lake in Kashmir is the largest fresh water lake in India.',
        true),
    Question('Sarah Jane was crowned Femina Miss India 2007.', true),
    Question('Sound waves travel faster than light.', false),
    Question(' The sound of ape is chatter.', false),
    Question('Oology is study of bird\'s sound.', false),
    Question('The tomb of Akbar is in New Delhi.', false),
    Question('Quit India (Bharat Chodo) Movement was launched by Bhagat Singh.',
        false),
    // Question('PETA means People Environment Training Association.', false),
    Question('Tipu Sultan signed a secret agreement with Napoleon.', true),
  ];
  Set1() {
    _questions.shuffle();
  }
  int size() {
    return _questions.length;
  }

  void nextQ() {
    _index++;
  }

  bool isFinished() {
    if (_index == _questions.length) {
      return true;
    }
    return false;
  }

  void reset() {
    _index = 0;
  }

  String getQText() {
    return _questions[_index].ques;
  }

  bool getQAns() {
    return _questions[_index].ans;
  }
}
