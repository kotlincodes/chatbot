class Iteractions {
  String _id;
  String _name;
  String _action;
  List<UserSaysBean> _userSays;
  List<dynamic> _triggers;
  List<dynamic> _parameters;
  List<ResponsesBean> _responses;

  String get id => _id;
  String get name => _name;
  String get action => _action;
  List<UserSaysBean> get userSays => _userSays;
  List<dynamic> get triggers => _triggers;
  List<dynamic> get parameters => _parameters;
  List<ResponsesBean> get responses => _responses;

  Iteractions(this._id, this._name, this._action, this._userSays, this._triggers, this._parameters, this._responses);

  Iteractions.map(dynamic obj) {
    _id = obj["id"];
    _name = obj["name"];
    _action = obj["action"];
    _userSays = obj["userSays"];
    _triggers = obj["triggers"];
    _parameters = obj["parameters"];
    _responses = obj["responses"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["action"] = _action;
    map["userSays"] = _userSays;
    map["triggers"] = _triggers;
    map["parameters"] = _parameters;
    map["responses"] = _responses;
    return map;
  }

}

class ResponsesBean {
  String _type;
  String _title;
  List<ButtonsBean> _buttons;
  List<dynamic> _filters;
  int _delay;

  String get type => _type;
  String get title => _title;
  List<ButtonsBean> get buttons => _buttons;
  List<dynamic> get filters => _filters;
  int get delay => _delay;

  ResponsesBean(this._type, this._title, this._buttons, this._filters, this._delay);

  ResponsesBean.map(dynamic obj) {
    _type = obj["type"];
    _title = obj["title"];
    _buttons = obj["buttons"];
    _filters = obj["filters"];
    _delay = obj["delay"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["title"] = _title;
    map["buttons"] = _buttons;
    map["filters"] = _filters;
    map["delay"] = _delay;
    return map;
  }

}

class ButtonsBean {
  String _id;
  String _type;
  String _title;
  String _value;
  List<dynamic> _actions;

  String get id => _id;
  String get type => _type;
  String get title => _title;
  String get value => _value;
  List<dynamic> get actions => _actions;

  ButtonsBean(this._id, this._type, this._title, this._value, this._actions);

  ButtonsBean.map(dynamic obj) {
    _id = obj["id"];
    _type = obj["type"];
    _title = obj["title"];
    _value = obj["value"];
    _actions = obj["actions"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["type"] = _type;
    map["title"] = _title;
    map["value"] = _value;
    map["actions"] = _actions;
    return map;
  }

}

class UserSaysBean {
  String _classifier;
  String _text;

  String get classifier => _classifier;
  String get text => _text;

  UserSaysBean(this._classifier, this._text);

  UserSaysBean.map(dynamic obj) {
    _classifier = obj["classifier"];
    _text = obj["text"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["classifier"] = _classifier;
    map["text"] = _text;
    return map;
  }

}