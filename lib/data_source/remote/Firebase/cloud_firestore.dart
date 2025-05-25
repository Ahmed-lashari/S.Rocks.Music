import 'package:skility_x/data_source/remote/Firebase/firestore_manager.dart';
import 'package:skility_x/models/cards.dart';

class CloudFirestoreService {
  // send datta (will be used only one time)
  static Future<void> saveDataInFirestore(
      List<Map<String, dynamic>> isList) async {
    await FirebaseManager.firestore
        .collection("music_cards_data")
        .doc("combined_documents")
        .set({"cards": isList});
  }

  // get datta
  static Future<List<MusicCardsModel>> retriveDataInFirestore() async {
    final doc = await FirebaseManager.firestore
        .collection("music_cards_data")
        .doc("combined_documents")
        .get();

    final List cards = doc['cards'];

    final data = cards.map((e) => MusicCardsModel.fromJson(e)).toList();

    return data;
  }
}
