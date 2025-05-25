import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/repository/FirebaseRepo/firestore_repo.dart';
import 'package:skility_x/models/cards.dart';
import 'package:skility_x/view/ui_config/screens/home/home.dart';
import 'package:toastification/toastification.dart';

class HomeAction {
  static Future<void> saveData() async {
    try {
      Utils.toastMsg("Saving data into database", ToastificationType.info);

      // get data to save in db
      final List<MusicCardsModel> isList = HomeConfig.getMusicCardData();

      // save data
      final submitted = await CloudFirestoreRepo.saveDataInFirestore(isList);

      // popup message
      submitted
          ? Utils.toastMsg("Successfully saved", ToastificationType.success)
          : Utils.toastMsg("Error Saving Data", ToastificationType.warning);
    } catch (e, h) {
      Utils.handleError(e, h);
      Utils.toastMsg("Error Saving Data: $e", ToastificationType.warning);
    }
  }
}
