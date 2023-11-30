import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClTNyWbqAh0yWsfrGEi8iCz0kqKbkoXoE',
    appId: '1:705561206687:android:9ad25565ef2804d9fbe7aa',
    messagingSenderId: '490028130190',
    projectId: 'com.beacon.pregnancy',
    storageBucket: 'golfzon-gsm.appspot.com',
    androidClientId: '490028130190-mdagqnl1gfk3ohb0qvdokntrsho57n6o.apps.googleusercontent.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDI5gYkmW7od5GYj7MGK9truWICrx4OMDg',
    appId: '1:705561206687:ios:c4bd4ca65efbd229fbe7aa',
    messagingSenderId: '855984490695',
    projectId: 'com.beacon.pregnancy',
    storageBucket: 'driver-licens.appspot.com',
    iosClientId: 'com.googleusercontent.apps.855984490695-r2ghgkhjnjcp6f93dfopk70uote87f9u',
    iosBundleId: 'com.beacon.pregnancy',
  );
}
