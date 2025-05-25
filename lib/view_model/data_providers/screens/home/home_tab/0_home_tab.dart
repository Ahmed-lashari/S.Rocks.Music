import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skility_x/data_source/repository/FirebaseRepo/firestore_repo.dart';
import 'package:skility_x/models/cards.dart';

final retriveCardsDataProvider =
    FutureProvider<List<MusicCardsModel>>((ref) async {
  return await CloudFirestoreRepo.retriveDataInFirestore();
});
