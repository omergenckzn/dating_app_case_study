import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:dating_app/locator.dart' as di;

abstract class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    di.setup();
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stack,
      );
      return true;
    };
  }
}
