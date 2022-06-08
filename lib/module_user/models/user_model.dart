class User {
  String? username, _email, _password;
  DateTime? lastSeen;
  String? img;
  bool? online;

  User(this._email, this._password,
      {this.username, this.img, this.lastSeen, this.online});

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  toJson() => {
        "username": username,
        "email": _email,
        "image": img,
        "lastSeen": lastSeen,
        "online": online
      };

  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(json['email'], "NO",
        lastSeen: DateTime.fromMicrosecondsSinceEpoch(
            json['lastSeen'].microsecondsSinceEpoch),
        username: json['username'],
        img: json['image'],
        online: json['online']);
    return user;
  }
}
