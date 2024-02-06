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
    apiKey: 'AIzaSyC3UDtvd1Qh2YMjTnQYmgzLyyqT--f_so4',
    appId: '1:10008284210:web:bb79682696bb86fd66002b',
    messagingSenderId: '10008284210',
    projectId: 'bynry-task',
    authDomain: 'bynry-task.firebaseapp.com',
    storageBucket: 'bynry-task.appspot.com',
    measurementId: 'G-J9L251WERC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKd3QmSo3c1IHFgF48XX1h0S76OsbJBUA',
    appId: '1:10008284210:android:bf315e58c75b8e8b66002b',
    messagingSenderId: '10008284210',
    projectId: 'bynry-task',
    storageBucket: 'bynry-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByupJoJDOj16s-3_FajEJgcjoui4f_POI',
    appId: '1:10008284210:ios:9b548075d4e151d666002b',
    messagingSenderId: '10008284210',
    projectId: 'bynry-task',
    storageBucket: 'bynry-task.appspot.com',
    iosBundleId: 'com.example.bynryTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByupJoJDOj16s-3_FajEJgcjoui4f_POI',
    appId: '1:10008284210:ios:a099d78804eb1c1166002b',
    messagingSenderId: '10008284210',
    projectId: 'bynry-task',
    storageBucket: 'bynry-task.appspot.com',
    iosBundleId: 'com.example.bynryTask.RunnerTests',
  );
}
