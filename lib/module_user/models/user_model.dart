class User{
  String? username , _email , _password;
  String? img;

  User(this._email , this._password , {this.username, this.img});

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }
}