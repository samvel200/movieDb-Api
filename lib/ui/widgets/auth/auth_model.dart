import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviedb/domain/api_client/api_client.dart';
import 'package:moviedb/domain/data_provibers/session_data_provider.dart';
import 'package:moviedb/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataprivier = SessionDataProvider();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessege;
  String? get errorMessage => _errorMessege;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessege = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessege = null;
    _isAuthProgress = true;
    notifyListeners();

    String? sessionId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } catch (e) {
      _errorMessege = 'Hеправильный логин или пароль';
    }

    _isAuthProgress = false;
    if (_errorMessege != null) {
      notifyListeners();
      return;
    }
    if (sessionId == null) {
      _errorMessege = 'Неизвестная ошибка повторите попытку';
      notifyListeners();
      return;
    }
    await _sessionDataprivier.setSessionId(sessionId);

    unawaited(Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen));
  }
}
