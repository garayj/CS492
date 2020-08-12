class Post {
  String _date;
  String _imageURL;
  int _quantity;
  double _latitude;
  double _longitude;

  Post({date, url, quantity, lat, long})
      : _date = date,
        _imageURL = url,
        _quantity = quantity,
        _latitude = lat,
        _longitude = long;

  String get date => _date;
  String get url => _imageURL;
  int get quantity => _quantity;
  double get lat => _latitude;
  double get long => _longitude;
}
