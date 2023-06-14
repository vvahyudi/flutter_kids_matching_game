import 'package:get_storage/get_storage.dart';

class Utilities {
  late int selectedGameLevel;
  late String temp;

  int getGameLevel() {
    temp = GetStorage().read('selectedLevel');
    selectedGameLevel = temp.contains('1') ? 1 : 1;

    return selectedGameLevel;
  }

  void nextGameLevel() {
    temp = GetStorage().read('selectedLevel');
    if (temp.contains('1')) {
      GetStorage().write('selectedLevel', "Level 1");
    }
  }
}
