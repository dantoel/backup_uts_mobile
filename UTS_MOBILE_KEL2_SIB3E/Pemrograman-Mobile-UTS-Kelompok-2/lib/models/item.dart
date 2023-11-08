class Item {
  int? _id;
  String _genre = '';
  String _gender = '';
  int _age = 0;
  double _gpa = 0.0;
  int _year = 0;
  int _count = 0;
  String _nationality = '';
  String _report = '';

  int? get id => _id;
  String get genre => _genre;
  String get gender => _gender;
  int get age => _age;
  double get gpa => _gpa;
  int get year => _year;
  int get count => _count;
  String get nationality => _nationality;
  String get report => _report;

  set id(int? value) => _id = value;
  set genre(String? value) => _genre = value!;
  set gender(String? value) => _gender = value!;
  set age(int? value) => _age = value!;
  set gpa(double? value) => _gpa = value!;
  set year(int? value) => _year = value!;
  set count(int? value) => _count = value!;
  set nationality(String? value) => _nationality = value!;
  set report(String? value) => _report = value!;

// konstruktor versi 1
  Item(this._genre, this._gender, this._age, this._gpa, this._year, this._count,
      this._nationality, this._report);

// konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _genre = map['genre'];
    _gender = map['gender'];
    _age = map['age'];
    _gpa = map['gpa'];
    _year = map['year'];
    _count = map['count'];
    _nationality = map['nationality'];
    _report = map['report'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = _id;
    map['genre'] = _genre;
    map['gender'] = _gender;
    map['age'] = _age;
    map['gpa'] = _gpa;
    map['year'] = _year;
    map['count'] = _count;
    map['nationality'] = _nationality;
    map['report'] = _report;
    return map;
  }
}
