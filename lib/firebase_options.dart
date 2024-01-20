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
    apiKey: 'AIzaSyAEETnej2n_93c8Xvqw2k92QSRonwkUYXo',
    appId: '1:673179245974:web:9cfdef6381fbfc45cf51b7',
    messagingSenderId: '673179245974',
    projectId: 'ecombuy',
    authDomain: 'ecombuy.firebaseapp.com',
    storageBucket: 'ecombuy.appspot.com',
    measurementId: 'G-Z4JR6L7VDT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-rG0gkn2f2BTWfZpLoRsV-q0668CzFjI',
    appId: '1:673179245974:android:2f78f1d6f2e1e23acf51b7',
    messagingSenderId: '673179245974',
    projectId: 'ecombuy',
    storageBucket: 'ecombuy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqs-7cHRBke4bvQTKhz9upkgkojZpL_kg',
    appId: '1:673179245974:ios:0f1a1b21df63fbcfcf51b7',
    messagingSenderId: '673179245974',
    projectId: 'ecombuy',
    storageBucket: 'ecombuy.appspot.com',
    iosBundleId: 'com.example.ecomBuy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqs-7cHRBke4bvQTKhz9upkgkojZpL_kg',
    appId: '1:673179245974:ios:31686cba1908152ccf51b7',
    messagingSenderId: '673179245974',
    projectId: 'ecombuy',
    storageBucket: 'ecombuy.appspot.com',
    iosBundleId: 'com.example.ecomBuy.RunnerTests',
  );
}
