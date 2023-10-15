import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // IOS and MacOS
      return const FirebaseOptions(
        appId: '1:353977284216:ios:5a5ac9f490519d84eedf8d',
        apiKey: 'AIzaSyDew_TIg_JvBWUcpxmGzFgydFHCntxCip4',
        projectId: 'ecommerce-pro-5404a',
        messagingSenderId: '353977284216',
        iosBundleId: 'com.example.ecommercepro',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:353977284216:android:7b706c045305c142eedf8d',
        apiKey: 'AIzaSyA5SjgLWFTCdSFcbNn-U5pmTB6IajBZLIk',
        projectId: 'ecommerce-pro-5404a',
        messagingSenderId: '353977284216',
      );
    }
  }
}
