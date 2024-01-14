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
    apiKey: 'AIzaSyAIyb-sO59u5gGjhK6E6Goe_vW4UYFtNu0',
    appId: '1:583681373827:web:70b39e39cec6bf4ecacdb6',
    messagingSenderId: '583681373827',
    projectId: 'item-display-and-preorder-app',
    authDomain: 'item-display-and-preorder-app.firebaseapp.com',
    storageBucket: 'item-display-and-preorder-app.appspot.com',
    measurementId: 'G-V95BX0N9QK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBI-2Ff9m2moBa7mU8FZWHpSYFRoXvF6rY',
    appId: '1:583681373827:android:58b0baeff82b789fcacdb6',
    messagingSenderId: '583681373827',
    projectId: 'item-display-and-preorder-app',
    storageBucket: 'item-display-and-preorder-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_-uxi2T7fCfBVfQlcDxMAxyjLH4Wsyho',
    appId: '1:583681373827:ios:20a33e50cb119b10cacdb6',
    messagingSenderId: '583681373827',
    projectId: 'item-display-and-preorder-app',
    storageBucket: 'item-display-and-preorder-app.appspot.com',
    iosBundleId: 'com.example.itemDisplayAndPreorderApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_-uxi2T7fCfBVfQlcDxMAxyjLH4Wsyho',
    appId: '1:583681373827:ios:330672fcece9a0eacacdb6',
    messagingSenderId: '583681373827',
    projectId: 'item-display-and-preorder-app',
    storageBucket: 'item-display-and-preorder-app.appspot.com',
    iosBundleId: 'com.example.itemDisplayAndPreorderApp.RunnerTests',
  );
}