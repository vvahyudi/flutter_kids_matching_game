// ignore_for_file: unused_local_variable

class GameItem {
  String image;
  String name;
  String value;
  bool accepting;
  String level;

  GameItem(
      {required this.image,
      required this.name,
      required this.value,
      this.accepting = false,
      required this.level});
}

void getList() {
  List<GameItem> choiceA;
  List<GameItem> choiceB;
  // choice_A = [
  //   GameItem(image: "assets/images/animals/Doe.png", name: "Doe", value: "doe"),
  //   GameItem(
  //       image: "assets/images/animals/Elephant.png",
  //       name: "Elephant",
  //       value: "elephant"),
  //   GameItem(image: "assets/images/animals/Ewe.png", name: "Ewe", value: "ewe"),
  //   GameItem(
  //       image: "assets/images/animals/Giraffe.png",
  //       name: "Giraffe",
  //       value: "giraffe"),
  //   GameItem(
  //       image: "assets/images/animals/Mule.png", name: "Mule", value: "mule"),
  //   GameItem(
  //       image: "assets/images/animals/Ostrich.png",
  //       // name: AppLocalizations.of(context)!.ostrich,
  //       name: "Ostrich",
  //       value: "ostrich"),
  // ];
  // choice_B = List<GameItem>.from(choice_A);
  //
  // choice_A.shuffle();
  // choice_B.shuffle();
}
