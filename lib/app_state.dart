import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _bearerAuth = prefs.getString('ff_bearerAuth') ?? _bearerAuth;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _bearerAuth =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VybmFtZVwiOlwiQ01IX0lOVEVHUkFUSU9OXCIsXCJpZFwiOlwiMzdmZmQxNDUtNzc3MS0zMmNmLWIzNzctZjc0OGM0MTQwNDQxXCJ9IiwiZXhwIjoxNzE3NTgxNzQ3fQ.GEGih_C066W3berV_N4bTsNQdN0abajJJVXLLVKz28a8KTFESU1sMlTz5aWWQWbnbZaBkjeCmRJOJLbFj3y0Sg';
  String get bearerAuth => _bearerAuth;
  set bearerAuth(String _value) {
    _bearerAuth = _value;
    prefs.setString('ff_bearerAuth', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
