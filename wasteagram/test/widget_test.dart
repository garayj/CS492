// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/models/post_dao.dart';

void main() {
  group("My unit tests", () {
    test("Check post date conversions", () {
      final postDAO = PostDAO();
      final now = DateTime.now().toString();
      final post = Post(
          date: now,
          url:
              'https://images.squarespace-cdn.com/content/v1/5cb62a904d546e33119fa495/1589302981165-HHQ2A4JI07C43294HVPD/ke17ZwdGBToddI8pDm48kA7bHnZXCqgRu4g0_U7hbNpZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PISCdr-3EAHMyS8K84wLA7X0UZoBreocI4zSJRMe1GOxcKMshLAGzx4R3EDFOm1kBS/fluffy+corgi',
          quantity: 1,
          lat: 10.0,
          long: 12.9);
      final postDate = DateTime.parse(post.date);

      expect(postDAO.shortDate(post.date),
          DateFormat.yMMMEd("en_US").format(postDate));
      expect(postDAO.longDate(post.date),
          DateFormat.yMMMMEEEEd("en_US").format(postDate));
    });
    test("Post Constructor", () {
      final date = DateTime.now();
      final url =
          'https://images.squarespace-cdn.com/content/v1/5cb62a904d546e33119fa495/1589302981165-HHQ2A4JI07C43294HVPD/ke17ZwdGBToddI8pDm48kA7bHnZXCqgRu4g0_U7hbNpZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PISCdr-3EAHMyS8K84wLA7X0UZoBreocI4zSJRMe1GOxcKMshLAGzx4R3EDFOm1kBS/fluffy+corgi';
      final quantity = 4;
      final lat = 2.23;
      final long = 29.19;
      final post =
          Post(date: date, url: url, quantity: quantity, lat: lat, long: long);

      expect(post, isInstanceOf<Post>());
      expect(post.url, url);
      expect(post.quantity, quantity);
      expect(post.lat, lat);
      expect(post.long, long);
    });
    test("PostDAO", () {
      final date = Timestamp.now();
      final url =
          'https://images.squarespace-cdn.com/content/v1/5cb62a904d546e33119fa495/1589302981165-HHQ2A4JI07C43294HVPD/ke17ZwdGBToddI8pDm48kA7bHnZXCqgRu4g0_U7hbNpZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PISCdr-3EAHMyS8K84wLA7X0UZoBreocI4zSJRMe1GOxcKMshLAGzx4R3EDFOm1kBS/fluffy+corgi';
      final lat = 2.23;
      final long = 29.19;
      List dummyData = [];
      for (var i = 0; i < 10; i++) {
        dummyData.add({
          "date": date,
          "quantity": i,
          "imageURL": url,
          "position": GeoPoint(lat, long),
        });
      }
      final posts = PostDAO().convertToPosts(dummyData);
      expect(posts, isInstanceOf<List<Post>>());
      expect(posts[0].url, url);
    });
  });
}
