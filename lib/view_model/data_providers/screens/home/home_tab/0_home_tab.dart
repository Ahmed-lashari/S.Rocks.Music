import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/data_source/repository/FirebaseRepo/firestore_repo.dart';
import 'package:skility_x/models/cards.dart';
import 'package:skility_x/view/ui_config/screens/home/home.dart';

final retriveCardsDataProvider =
    FutureProvider<List<MusicCardsModel>>((ref) async {
  return await CloudFirestoreRepo.retriveDataInFirestore();
});

final saveCardsDataProvider = FutureProvider<void>((ref) async {
  // get data
  final List<MusicCardsModel> isList = HomeConfig.getMusicCardData();

  // save data
  await CloudFirestoreRepo.saveDataInFirestore(isList);
});
