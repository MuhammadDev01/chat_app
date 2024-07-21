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
    apiKey: 'AIzaSyDEMLu6JCNix9VJ6vTLbMn_yNbC24e90S8',
    appId: '1:629047057862:web:a896c8b2406756e06166c7',
    messagingSenderId: '629047057862',
    projectId: 'chat-app-14fef',
    authDomain: 'chat-app-14fef.firebaseapp.com',
    storageBucket: 'chat-app-14fef.appspot.com',
    measurementId: 'G-HLQH6CG4EX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVFd_wm7d-PnGyfInd97RIbSS8lA9dbG0',
    appId: '1:629047057862:android:bddbedcb52d10f9d6166c7',
    messagingSenderId: '629047057862',
    projectId: 'chat-app-14fef',
    storageBucket: 'chat-app-14fef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsl2S692MBrQOw4kurCbm_Q4OkTqbbRXc',
    appId: '1:629047057862:ios:534f43c6c9b951946166c7',
    messagingSenderId: '629047057862',
    projectId: 'chat-app-14fef',
    storageBucket: 'chat-app-14fef.appspot.com',
    iosClientId: '629047057862-mmrtjanlj9f609l62edh21qa2g5qrqq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsl2S692MBrQOw4kurCbm_Q4OkTqbbRXc',
    appId: '1:629047057862:ios:534f43c6c9b951946166c7',
    messagingSenderId: '629047057862',
    projectId: 'chat-app-14fef',
    storageBucket: 'chat-app-14fef.appspot.com',
    iosClientId: '629047057862-mmrtjanlj9f609l62edh21qa2g5qrqq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
