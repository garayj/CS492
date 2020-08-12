import './post.dart';
import 'package:intl/intl.dart';

class PostDAO {
  Post _convertToPost(doc) {
    return Post(
        date: doc['date'].toDate().toString(),
        quantity: doc['quantity'],
        lat: doc['position'].latitude,
        long: doc["position"].longitude,
        url: doc["imageURL"]);
  }

  String longDate(String date, [locale = "en_US"]) =>
      DateFormat.yMMMMEEEEd(locale).format(DateTime.parse(date));
  String shortDate(date, [locale = "en_US"]) =>
      DateFormat.yMMMEd(locale).format(DateTime.parse(date));

  List<Post> convertToPosts(docs) =>
      docs.map<Post>((post) => _convertToPost(post)).toList();
}
