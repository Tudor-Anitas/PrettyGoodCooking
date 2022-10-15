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
    apiKey: 'AIzaSyCuqEVq4xB4eFoiW2o30SoMEyGTHmD0gls',
    appId: '1:117244972046:web:cfe30c02749d984d98805f',
    messagingSenderId: '117244972046',
    projectId: 'prettygoodcooking-926a3',
    authDomain: 'prettygoodcooking-926a3.firebaseapp.com',
    storageBucket: 'prettygoodcooking-926a3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3rxVKmOqBE7Mdf_w7_NLOXRduGlgg-n0',
    appId: '1:117244972046:android:136202381116b18b98805f',
    messagingSenderId: '117244972046',
    projectId: 'prettygoodcooking-926a3',
    storageBucket: 'prettygoodcooking-926a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFQzHH-9eo9b8nl6NzefAnvWrlFTgDj4A',
    appId: '1:117244972046:ios:fb391dc67dbc8b3198805f',
    messagingSenderId: '117244972046',
    projectId: 'prettygoodcooking-926a3',
    storageBucket: 'prettygoodcooking-926a3.appspot.com',
    iosClientId: '117244972046-kbgtm669uf7plinkhj3bothhtk1n53me.apps.googleusercontent.com',
    iosBundleId: 'com.example.prettyGoodCooking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFQzHH-9eo9b8nl6NzefAnvWrlFTgDj4A',
    appId: '1:117244972046:ios:fb391dc67dbc8b3198805f',
    messagingSenderId: '117244972046',
    projectId: 'prettygoodcooking-926a3',
    storageBucket: 'prettygoodcooking-926a3.appspot.com',
    iosClientId: '117244972046-kbgtm669uf7plinkhj3bothhtk1n53me.apps.googleusercontent.com',
    iosBundleId: 'com.example.prettyGoodCooking',
  );
}
