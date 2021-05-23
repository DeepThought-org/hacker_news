class NotEmptyString {
  NotEmptyString(this._value);

  final String _value;

  String? value() {
    if (_value.isNotEmpty) {
      return _value;
    } else {
      return null;
    }
  }
}
