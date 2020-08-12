import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBase {
  static const _COLLECTION = "posts";
  final streamPosts = Firestore.instance
      .collection(_COLLECTION)
      .orderBy("date", descending: true)
      .snapshots();

  Future<StorageReference> addImageToCloudStorage(image) async {
    final StorageReference store = FirebaseStorage().ref().child(image.path);
    await store.putFile(image).onComplete;
    return store;
  }

  Future<void> addPostToFirestore(
      String url, int quantity, double lat, double long) async {
    await Firestore.instance.collection(_COLLECTION).add({
      "imageURL": url,
      "quantity": quantity,
      "date": DateTime.now(),
      "position": GeoPoint(lat, long),
    });
  }
}
