import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // getter
  static final FirebaseFirestore firestore = _firestore;
}
