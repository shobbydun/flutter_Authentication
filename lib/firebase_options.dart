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
    apiKey: 'AIzaSyAUp82R3ppeGFmiGg04otKptamstkTufVA',
    appId: '1:368226906209:web:2c0ae31a16ffa165793a20',
    messagingSenderId: '368226906209',
    projectId: 'zinker-4397f',
    authDomain: 'zinker-4397f.firebaseapp.com',
    storageBucket: 'zinker-4397f.appspot.com',
    measurementId: 'G-4VC011EHJK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC72KO-lGg-GjSkwtr8hd_DZwRVIkSw9Z8',
    appId: '1:368226906209:android:7e7f54e5a34184c4793a20',
    messagingSenderId: '368226906209',
    projectId: 'zinker-4397f',
    storageBucket: 'zinker-4397f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmQz6FSzK5mk-oY2W97Ob7XKuAWdKYBXg',
    appId: '1:368226906209:ios:9fe840c0c043dcc3793a20',
    messagingSenderId: '368226906209',
    projectId: 'zinker-4397f',
    storageBucket: 'zinker-4397f.appspot.com',
    iosBundleId: 'com.example.flutterAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmQz6FSzK5mk-oY2W97Ob7XKuAWdKYBXg',
    appId: '1:368226906209:ios:9fe840c0c043dcc3793a20',
    messagingSenderId: '368226906209',
    projectId: 'zinker-4397f',
    storageBucket: 'zinker-4397f.appspot.com',
    iosBundleId: 'com.example.flutterAuthentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAUp82R3ppeGFmiGg04otKptamstkTufVA',
    appId: '1:368226906209:web:8994ab7a36d1e5eb793a20',
    messagingSenderId: '368226906209',
    projectId: 'zinker-4397f',
    authDomain: 'zinker-4397f.firebaseapp.com',
    storageBucket: 'zinker-4397f.appspot.com',
    measurementId: 'G-D5VMM9PL3E',
  );
}
