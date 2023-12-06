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
    apiKey: 'AIzaSyAEh5xjxtoyldUddH86c8LrM1UzlIzHy1A',
    appId: '1:585621298675:web:f3cd78e26ab7d17e7d4686',
    messagingSenderId: '585621298675',
    projectId: 'chat-app-cd76b',
    authDomain: 'chat-app-cd76b.firebaseapp.com',
    storageBucket: 'chat-app-cd76b.appspot.com',
    measurementId: 'G-990KQV3E8E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjyDrADOnl9YnRenfkxezl865bF5AiOlI',
    appId: '1:585621298675:android:118a6f6b169b0a727d4686',
    messagingSenderId: '585621298675',
    projectId: 'chat-app-cd76b',
    storageBucket: 'chat-app-cd76b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV8VkErT9lOYvPQY3Oe3157VUusO5CCFA',
    appId: '1:585621298675:ios:4f5955da1fd710817d4686',
    messagingSenderId: '585621298675',
    projectId: 'chat-app-cd76b',
    storageBucket: 'chat-app-cd76b.appspot.com',
    iosBundleId: 'com.example.scrollerChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCV8VkErT9lOYvPQY3Oe3157VUusO5CCFA',
    appId: '1:585621298675:ios:76b2ef503ffedeea7d4686',
    messagingSenderId: '585621298675',
    projectId: 'chat-app-cd76b',
    storageBucket: 'chat-app-cd76b.appspot.com',
    iosBundleId: 'com.example.scrollerChat.RunnerTests',
  );
}
