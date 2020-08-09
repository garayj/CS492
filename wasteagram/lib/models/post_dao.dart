import 'package:cloud_firestore/cloud_firestore.dart';
import './post.dart';

class PostDAO {
  Post convertToPost(snapshot) {
    return Post(
        date: DateTime.parse(
          snapshot['date'].toDate().toString(),
        ),
        quantity: snapshot['quantity'],
        lat: snapshot['position'].latitude,
        long: snapshot["position"].longitude,
        url: snapshot["imageURL"]);
  }
}
