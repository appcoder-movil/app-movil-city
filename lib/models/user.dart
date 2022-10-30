class User {
  var _name;
  var _email;
  var _password;
  var _created_at;

  User(this._name, this._email, this._password, this._created_at);

  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get created_at => _created_at;

  set created_at(value) {
    _created_at = value;
  }

}
