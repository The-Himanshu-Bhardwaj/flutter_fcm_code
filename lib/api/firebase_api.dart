import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint(message.notification?.title);
  debugPrint(message.notification?.body);
}

class FirebaseApi {

  final _firebaseMessaging = FirebaseMessaging.instance;


  /// CALLED ON INITIALIZATION
  Future<void> initNotification() async {

    // CHECKS AND REQUESTS PERMISSION ON BOTH PLATFORMS
    await _firebaseMessaging.requestPermission();

    // GETTING FCM TOKEN FOR THIS DEVICE
    final fcmTokenOfDevice = await _firebaseMessaging.getToken();
    log('TOKEN BELOW \n');
    log(fcmTokenOfDevice.toString());
    log('\nTOKEN ABOVE');
    
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }
  


}