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
    apiKey: 'AIzaSyCjF_tuhwqwk7gmNKzqqxzuPKbrLPW8gFs',
    appId: '1:341551565715:web:4d16396adfa128dc613666',
    messagingSenderId: '341551565715',
    projectId: 'plant-disease-25796',
    authDomain: 'plant-disease-25796.firebaseapp.com',
    storageBucket: 'plant-disease-25796.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDI0SgSn8uIrPCYdvyHTEUAgZp3QR4-e7A',
    appId: '1:341551565715:android:600b32e8e2e380a7613666',
    messagingSenderId: '341551565715',
    projectId: 'plant-disease-25796',
    storageBucket: 'plant-disease-25796.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBI5TF0kabCbLbscTMjdEkXMScv_XgohbM',
    appId: '1:341551565715:ios:d3958b085871257b613666',
    messagingSenderId: '341551565715',
    projectId: 'plant-disease-25796',
    storageBucket: 'plant-disease-25796.appspot.com',
    iosClientId: '341551565715-dferp0dijb8711gdqtci3e15i4ch6qg3.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBI5TF0kabCbLbscTMjdEkXMScv_XgohbM',
    appId: '1:341551565715:ios:d3958b085871257b613666',
    messagingSenderId: '341551565715',
    projectId: 'plant-disease-25796',
    storageBucket: 'plant-disease-25796.appspot.com',
    iosClientId: '341551565715-dferp0dijb8711gdqtci3e15i4ch6qg3.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );
}
