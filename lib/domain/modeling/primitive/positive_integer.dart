class PositiveInteger {
  PositiveInteger(this._value);

  int _value;

  int? value() {
    if (_value > 0) {
      return _value;
    } else {
      return null;
    }
  }
}