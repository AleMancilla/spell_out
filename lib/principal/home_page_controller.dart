import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:spell_out/database/database.dart';
import 'package:spell_out/models/word.dart';

class HomePageController extends GetxController {
  DicctionaryDataBase db = DicctionaryDataBase();
  Rx<String> principalWord = Rx<String>('Finding');

  @override
  void onInit() async {
    await randomWord();
    super.onInit();
  }

  Future<void> randomWord() async {
    Word word = await db.randomWord();
    principalWord.value = word.word;
  }

  getByWord() {
    db.getByWord('text');
  }

  findword(String text) async {
    int x = await db.getLength();
  }
}
