class User {
  var _uid;
  var _email;
  var _password;

  User(this._uid, this._email, this._password);

  User.Empty();

  User.fromJson(Map<String, dynamic> json)
      : _uid=json['uid'],
        _email=json['email'],
        _password=json['password'];

  Map<String, dynamic> toJson() => {
      'uid':_uid,
      'email':_email,
      'password':_password
  };

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

}
