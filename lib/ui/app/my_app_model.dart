import 'package:moviedb/domain/data_provibers/session_data_provider.dart';

class MyAppModel {
  final _sessionDataprovider = SessionDataProvider();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataprovider.getSessionId();
    _isAuth = sessionId != null;
  }
}
