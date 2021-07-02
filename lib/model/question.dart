class Question {
  String question;
  List<dynamic> answer;
  String correctAnswer;
  String imagePath;

  Question({
    this.question,
    this.answer,
    this.correctAnswer,
    this.imagePath,
  });

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json["answer"];
    correctAnswer = json["correct_answer"];
    imagePath = json['image_path'];
  }
}
