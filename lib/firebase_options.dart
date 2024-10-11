// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDKkAnq6XHQkzhelWgaPyKwRNyZ8jtzmlE',
    appId: '1:8508383838:web:cdc1d7cd55f5b18018cacf',
    messagingSenderId: '8508383838',
    projectId: 'e-commerce-d6454',
    authDomain: 'e-commerce-d6454.firebaseapp.com',
    storageBucket: 'e-commerce-d6454.appspot.com',
    measurementId: 'G-9M0FEMRWGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqAOIAaE-Mq-pIUj0POOX__Ptg3guLsO8',
    appId: '1:8508383838:android:81a6d13a16c0343118cacf',
    messagingSenderId: '8508383838',
    projectId: 'e-commerce-d6454',
    storageBucket: 'e-commerce-d6454.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAScBo25dQHnsQirlZRPQUN8aurP0Ena34',
    appId: '1:8508383838:ios:eb3ca0b1be45311418cacf',
    messagingSenderId: '8508383838',
    projectId: 'e-commerce-d6454',
    storageBucket: 'e-commerce-d6454.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAScBo25dQHnsQirlZRPQUN8aurP0Ena34',
    appId: '1:8508383838:ios:eb3ca0b1be45311418cacf',
    messagingSenderId: '8508383838',
    projectId: 'e-commerce-d6454',
    storageBucket: 'e-commerce-d6454.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKkAnq6XHQkzhelWgaPyKwRNyZ8jtzmlE',
    appId: '1:8508383838:web:4fff0fed54ece50018cacf',
    messagingSenderId: '8508383838',
    projectId: 'e-commerce-d6454',
    authDomain: 'e-commerce-d6454.firebaseapp.com',
    storageBucket: 'e-commerce-d6454.appspot.com',
    measurementId: 'G-3JFDL570B8',
  );
}
