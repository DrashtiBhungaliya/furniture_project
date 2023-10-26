import 'package:firebase_database/firebase_database.dart';

class FireBaseServices {
  static FirebaseDatabase? firebaseDatabase;

  static void init() {
    firebaseDatabase = FirebaseDatabase.instance;
  }

  static Future<void> setData(
      DatabaseReference reference, Map<String, dynamic> data) async {
    await reference.set(data);
  }

  static Future<Map?> getData(DatabaseReference reference) async {
    Map? allData;
    await reference.get().then(
      (value) {
        allData = value.value == null ? null : value.value as Map;
      },
    );
    return allData;
  }
  static Future<void> updateData(
      DatabaseReference reference, Map<String, dynamic> data) async {
    await reference.update(data);
  }

}
