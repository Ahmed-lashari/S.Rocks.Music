import 'package:firebase_core/firebase_core.dart';
import 'package:skility_x/firebase_options.dart';

class InitDependencies {
  static Future<void> initBootStrap() async {
    await _initFirebase();
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
