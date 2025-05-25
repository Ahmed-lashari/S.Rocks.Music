import 'package:skility_x/data_source/repository/FirebaseRepo/firestore_repo.dart';
import 'package:skility_x/models/cards.dart';
import 'package:skility_x/view/ui_config/screens/home/home.dart';

class HomeAction {
  static Future<bool> saveData() async {
    // get data
    final List<MusicCardsModel> isList = HomeConfig.getMusicCardData();

    // save data
    return await CloudFirestoreRepo.saveDataInFirestore(isList);
  }
}
