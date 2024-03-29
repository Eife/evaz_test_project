// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDKRa6MOiElz--soijOrZiHQ_1yPbYNZfU',
    appId: '1:834176083269:web:bfbad337ba48a1ab438a2c',
    messagingSenderId: '834176083269',
    projectId: 'evaz-test-project-bd619',
    authDomain: 'evaz-test-project-bd619.firebaseapp.com',
    storageBucket: 'evaz-test-project-bd619.appspot.com',
    measurementId: 'G-E8GK59XCYN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbRLp9WzU8OIYoIeAJ_WidUbLXCrXnCXk',
    appId: '1:834176083269:android:fa22eb0b52e8d11c438a2c',
    messagingSenderId: '834176083269',
    projectId: 'evaz-test-project-bd619',
    storageBucket: 'evaz-test-project-bd619.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWm6bEEVTlgigAkgb9OAcP3uB0G7Ap0q0',
    appId: '1:834176083269:ios:119ce9635d4bb21b438a2c',
    messagingSenderId: '834176083269',
    projectId: 'evaz-test-project-bd619',
    storageBucket: 'evaz-test-project-bd619.appspot.com',
    iosBundleId: 'com.example.evazTestProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWm6bEEVTlgigAkgb9OAcP3uB0G7Ap0q0',
    appId: '1:834176083269:ios:2b9ba4c32c8dc785438a2c',
    messagingSenderId: '834176083269',
    projectId: 'evaz-test-project-bd619',
    storageBucket: 'evaz-test-project-bd619.appspot.com',
    iosBundleId: 'com.example.evazTestProject.RunnerTests',
  );
}
