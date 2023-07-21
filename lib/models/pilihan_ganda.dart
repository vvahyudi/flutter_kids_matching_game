class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Sumpah Pemuda terjadi pada tanggal ...",
    [
      Answer("17 Agustus", false),
      Answer("21 April", true),
      Answer("10 November", false),
      Answer("28 Oktober", false),
    ],
  ));
  list.add(Question(
    "Saat terjadi Sumpah Pemuda, Indonesia masih dijajah oleh negara ...",
    [
      Answer("Inggris", false),
      Answer("Belanda", true),
      Answer("Amerika", false),
      Answer("Rusia", false),
    ],
  ));
  list.add(Question(
    "Para pemuda Indonesia pada zaman dahulu melakukan sumpah pemuda agar dapat ….",
    [
      Answer("Menjadi penguasa", false),
      Answer("Terus sekolah", false),
      Answer("Bersatu mengusir penjajah", true),
      Answer("Menjadi tentara belanda", false),
    ],
  ));
  list.add(Question(
    "Para pemuda berikrar bahwa mengaku bertumpah darah yang satu, yaitu ….",
    [
      Answer("Tanah air Jawa", false),
      Answer("Tanah air Nusantara", false),
      Answer("Tanah air Indonesia", true),
      Answer("Tanah air Sabang Merauke", false),
    ],
  ));
  list.add(Question(
    "Wilayah Indonesia disebut pula dengan istilah ….",
    [
      Answer("Sunda Kelapa", false),
      Answer("Tanah Rencong", true),
      Answer("Negeri atas angin", false),
      Answer("Nusantara", true),
    ],
  ));
  list.add(Question(
    "Satu nusa berarti satu ….",
    [
      Answer("Tanah Air", true),
      Answer("Bahasa", false),
      Answer("Budaya", false),
      Answer("Kesatuan", false),
    ],
  ));
  list.add(Question(
    "Indonesia adalah negara yang memiliki ….",
    [
      Answer("Sedikit Pulau", false),
      Answer("Satu Pulau", false),
      Answer("Puluhan Pulau", false),
      Answer("Ribuan Pulau", true),
    ],
  ));
  list.add(Question(
    "Berikut ini yang tidak termasuk suku-suku yang ada di Indonesia adalah ….",
    [
      Answer("Suku Jawa dan Suku Sunda", false),
      Answer("Suku Indian dan Suku Aborigin", true),
      Answer("Suku Batak dan Suku Dayak", false),
      Answer("Suku Asmat dan Suku Minangkabau", false),
    ],
  ));

  return list;
}
