import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'app.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    FlutterError.dumpErrorToConsole(errorDetails);
  };
  await FirebaseCrashlytics.instance.sendUnsentReports();

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  if (kDebugMode) {
    try {
      final localhost = switch (defaultTargetPlatform) {
        TargetPlatform.android => '10.0.2.2',
        _ => 'localhost',
      };

      FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  runApp(App());
}
