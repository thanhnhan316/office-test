import 'package:flutter_app/src/presentation/tests/model_tests/anwser.dart';

class Question {
  List<Anwser> anwser;
  String question;

  Question(this.anwser, this.question);
}

List<String> listQuestion() {
  List<String> list = <String>[];

  list.add('Sinh viên chọn mục Kết quả h tra xem còn nợ học phí không');
  list.add(
      'In summary, the above discussion mainly discusses several constructors a');
  list.add('Normally, the first three can already meet our daily use needs');
  list.add('SliverChildBuilderDelegate');
  list.add('I recently studied flutter and will continue to record my');
  list.add('The adapter of the type of list, the list is divided into three,');
  list.add('u can copy paste run fu');
  list.add('You can use nested ListView.separated');
  list.add('So please help me do that, this is the main file');
  list.add('Có 2 loại List, đó là loại mà số phần tử có');
  list.add('thể thay đổi và loại list có số phần tử cố định');
  list.add('Sinh viên chọn mục Kết quả h tra xem còn nợ học phí không');
  list.add(
      'In summary, the above discussion mainly discusses several constructors a');
  list.add('Normally, the first three can already meet our daily use needs');
  list.add('SliverChildBuilderDelegate');
  list.add('I recently studied flutter and will continue to record my');
  list.add('The adapter of the type of list, the list is divided into three,');
  list.add('u can copy paste run fu');
  list.add('You can use nested ListView.separated');
  list.add('So please help me do that, this is the main file');
  list.add('Có 2 loại List, đó là loại mà số phần tử có');
  list.add('thể thay đổi và loại list có số phần tử cố định');
  list.add('Sinh viên chọn mục Kết quả h tra xem còn nợ học phí không');
  list.add(
      'In summary, the above discussion mainly discusses several constructors a');
  list.add('Normally, the first three can already meet our daily use needs');
  list.add('SliverChildBuilderDelegate');
  list.add('I recently studied flutter and will continue to record my');
  list.add('The adapter of the type of list, the list is divided into three,');
  list.add('u can copy paste run fu');
  list.add('You can use nested ListView.separated');

  return list;
}

List<Question> fakeQuestion() {
  List<Question> list = <Question>[];
  List<Anwser> listAnwser = fakeAnwer();
  List<String> listQuestions = listQuestion();
  print(listAnwser.length.toString());

  for (int i = 0; i < listQuestions.length; i++) {
    List<Anwser> list4Anwser = <Anwser>[];
    list4Anwser.add(listAnwser[4 * i + 0]);
    list4Anwser.add(listAnwser[4 * i + 1]);
    list4Anwser.add(listAnwser[4 * i + 2]);
    list4Anwser.add(listAnwser[4 * i + 3]);

    // print("LIST INP " + i.toString() + " " + list4Anwser.length.toString());
    list.add(Question(list4Anwser, listQuestions[i]));
  }
  return list;
}

// class Question {
//   final int id, answer;
//   final String question;
//   final List<String> options;

//   Question(this.id, this.question, this.answer, this.options);
// }

// const List sample_data = [
//   {
//     "id": 1,
//     "question":
//         "Flutter is an open-source UI software development kit created by ______",
//     "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
//     "answer_index": 1,
//   },
//   {
//     "id": 2,
//     "question": "When google release Flutter.",
//     "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
//     "answer_index": 2,
//   },
//   {
//     "id": 3,
//     "question": "A memory location that holds a single letter or number.",
//     "options": ['Double', 'Int', 'Char', 'Word'],
//     "answer_index": 2,
//   },
//   {
//     "id": 4,
//     "question": "What command do you use to output data to the screen?",
//     "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
//     "answer_index": 2,
//   },
// ];
