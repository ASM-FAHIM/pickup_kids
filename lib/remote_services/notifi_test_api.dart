import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/notificatio_test_model.dart';

class NotificationAPI {
  Future<List<NotificationModel>> notifiGetAPI() async {
    var response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) debugPrint('--------------');
    log('Successfully fetched');
    debugPrint('--------------');
    return notificationModelFromJson(response.body);
  }
}
