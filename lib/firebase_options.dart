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
    apiKey: 'AIzaSyDTKU4QYav9wW0NcviUEy_iSCRfEnE6Mvs',
    appId: '1:233440543850:web:cc3d2c7fc619da9268f613',
    messagingSenderId: '233440543850',
    projectId: 'shoppingbasket-3ece6',
    authDomain: 'shoppingbasket-3ece6.firebaseapp.com',
    storageBucket: 'shoppingbasket-3ece6.appspot.com',
    measurementId: 'G-EH1ETWK8M4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvuJGEvz2cml4pjBdmUZj2BzdHSTCfOtw',
    appId: '1:233440543850:android:bd0466e634e53c2d68f613',
    messagingSenderId: '233440543850',
    projectId: 'shoppingbasket-3ece6',
    storageBucket: 'shoppingbasket-3ece6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGiZeS2iMqFwger-m3uJGvKFgbjlCvE_w',
    appId: '1:233440543850:ios:8376475c026de59768f613',
    messagingSenderId: '233440543850',
    projectId: 'shoppingbasket-3ece6',
    storageBucket: 'shoppingbasket-3ece6.appspot.com',
    iosBundleId: 'com.example.shopBasketAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGiZeS2iMqFwger-m3uJGvKFgbjlCvE_w',
    appId: '1:233440543850:ios:935c727086c918a768f613',
    messagingSenderId: '233440543850',
    projectId: 'shoppingbasket-3ece6',
    storageBucket: 'shoppingbasket-3ece6.appspot.com',
    iosBundleId: 'com.example.shopBasketAdmin.RunnerTests',
  );
}