import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/cloud_firestore.dart';
import 'package:skility_x/models/cards.dart';

class CloudFirestoreRepo {
  static Future<bool> saveDataInFirestore(List<MusicCardsModel> data) async {
    try {
      final isList = data.map((e) => e.toJson()).toList();
      await CloudFirestoreService.saveDataInFirestore(isList);
      return true;
    } catch (e, h) {
      Utils.handleError(e, h);
      return false;
    }
  }

  static Future<List<MusicCardsModel>> retriveDataInFirestore() async {
    try {
      final doc = await CloudFirestoreService.retriveDataInFirestore();
      return doc;
    } catch (e, h) {
      Utils.handleError(e, h);
      return [];
    }
  }
}
