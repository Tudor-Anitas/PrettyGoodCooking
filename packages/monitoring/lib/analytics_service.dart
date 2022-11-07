import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(
      {required String name, Map<String, Object?>? parameters}) {
    return _analytics.logEvent(name: name, parameters: parameters);
  }
}
